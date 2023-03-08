import { db } from "../database/database.connection.js"

export async function addPost(req, res){
    try {
        const {url, comment, userId} = req.body
        
        
        await db.query('INSERT INTO posts (url, "userId", comment) VALUES ($1,$2,$3)', [url,userId,comment] )

        return res.send()
    } catch (error) {
        return res.status(500).send(error.message)
    }
}