package muta

import (
   "database/sql"
   "log"
)

type Comment struct {
	ID     int
	UserID int
	PostID int
	Title  string
	Body   string
}

func OpenDB() error {
     var err error
     db, err = sql.Open("postgres", "postgres://stan:888888@10.8.15.167:26257/bbs?sslmode=disable")
     if err != nil {
         log.Fatal(err)
         return err
     }
     return nil

}

func CloseDB() {
    db.Close()
}

func InsertComment(comment *Comment) error {
	var id int
	err := db.QueryRow(`
		INSERT INTO comments(user_id, post_id, title, body)
		VALUES ($1, $2, $3, $4)
		RETURNING id
	`, comment.UserID, comment.PostID, comment.Title, comment.Body).Scan(&id)
	if err != nil {
		return err
	}
	comment.ID = id
	return nil
}

func RemoveCommentByID(id int) error {
	_, err := db.Exec("DELETE FROM comments WHERE id=$1", id)
	return err
}

func GetCommentByIDAndPost(id int, postID int) (*Comment, error) {
	var (
		userID      int
		title, body string
	)
	err := db.QueryRow(`
		SELECT user_id, title, body
		FROM posts
		WHERE id=$1
		AND post_id=$2
	`, id, postID).Scan(&userID, &title, &body)
	if err != nil {
		return nil, err
	}
	return &Comment{
		ID:     id,
		UserID: userID,
		PostID: postID,
		Title:  title,
		Body:   body,
	}, nil
}

func GetCommentsForPost(id int) ([]*Comment, error) {
	rows, err := db.Query(`
		SELECT c.id, c.user_id, c.title, c.body
		FROM comments AS c
		WHERE c.post_id=$1
	`, id)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	var (
		comments    = []*Comment{}
		cid, userID int
		title, body string
	)
	for rows.Next() {
		if err = rows.Scan(&cid, &userID, &title, &body); err != nil {
			return nil, err
		}
		comments = append(comments, &Comment{
			ID:     cid,
			UserID: userID,
			PostID: id,
			Title:  title,
			Body:   body,
		})
	}
	return comments, nil
}
