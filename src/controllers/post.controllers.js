import { db } from "../database/database.connection.js"

export async function addPost(req, res){
    try {
        const {url, comment, userId} = req.body
        
        
        await db.query('INSERT INTO posts (url, "userId", comment) VALUES ($1,$2,$3)', [url,userId,comment] )

        return res.sendStatus(201)
    } catch (error) {
        
        if(error.detail.includes("is not present in table")){
            return res.status(404).send(error.detail)
        }
        return res.status(500).send(error.detail)
    }
}

export async function deletePost(req, res){
    try {
        const {postId} = req.body
        
        
        await db.query('DELETE FROM posts WHERE id = ($1)', [postId] )

        return res.sendStatus(202)
    } catch (error) {
        
        if(error.detail.includes("is not present in table")){
            return res.status(404).send(error.detail)
        }
        return res.status(500).send(error.detail)
    }
}