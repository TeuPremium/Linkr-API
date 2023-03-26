import { db } from "../database/database.connection.js";


export async function addTag(comment, postId) {
try {
    const commentArray = comment.split(" ");
    let hashtagId
    for (let index = 0; index < commentArray.length; index++) {       
        if(commentArray[index].includes("#")){
            hashtagId = await createTag(commentArray[index])
            await db.query(`
            INSERT INTO "postHashtag" ("hashtagId", "postId")
            VALUES ($1,$2)
            `, [hashtagId, postId])
             
        }
        
    }
    return 0
} 
catch (error) {
        return error
    }

}

export async function createTag(hashtag) {
    try {
        
        hashtag = hashtag.replace('#', '')
        const searchHashtagId = await db.query(`
        SELECT id FROM hashtag WHERE "hashtagName" = $1 
        `, [hashtag])
            
            if(!searchHashtagId.rowCount){
                const hashtagId = await db.query(`
                INSERT INTO hashtag ("hashtagName")
                VALUES ($1)
                RETURNING id
                `, [hashtag])
                return hashtagId.rows[0].id
            }

    return searchHashtagId.rows[0].id
    } 
    catch (error) {
        return error
        }
    
    }

export async function tagPosts(req, res){
    try {
        const {hashtag} = req.params
        console.log(hashtag)
        const hashtagId = await createTag(hashtag)
        console.log(hashtagId)
        const taggedPosts = await db.query(`
            SELECT * FROM "postHashtag"
            WHERE "hashtagId" = $1
        `, [hashtagId]) 

        return res.send(taggedPosts.rows)
    } catch (error) {
          return res.status(500).send(error.message);
    }
}