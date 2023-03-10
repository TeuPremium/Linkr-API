import { db } from "../database/database.connection.js";

export async function getRank(req, res, next){

  try {
    const hashtagRank = await db.query('SELECT "hashtagName", COUNT(*) AS count FROM hashtag GROUP BY "hashtagName" ORDER BY count DESC LIMIT 10;')
    return res.send(hashtagRank.rows)
    
  } catch (error) {
    return res.sendStatus(500)
    
  }
   
}