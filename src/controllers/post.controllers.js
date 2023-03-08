import { db } from "../database/database.connection.js"

export async function addPost(req, res){
    try {
        const {url, comment, userId} = req.body
        
        
        await db.query('INSERT INTO posts (url, "userId", comment) VALUES ($1,$2,$3)', [url,userId,comment] )

        return res.send()
    } catch (error) {
        console.log(error)
        if(error.detail.includes("is not present in table")){
            return res.status(404).send(error.detail)
        }
        return res.status(500).send(error.detail)
    }
}