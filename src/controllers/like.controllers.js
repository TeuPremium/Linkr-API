import { db } from "../database/database.connection.js";
import {
  deslikeRepository,
  getLikeRepository,
  likeRepository,
} from "../repositories/like.Repository.js";

//enviar infomações de like
export async function getLikes(req, res) {
  const { postId } = req.params;
  try {
    const result = await getLikeRepository(postId);
    const likedUsers = result.rows.map((l) => l.username);
    res.status(200).send({ likedUsers, count: likedUsers.length });
  } catch (error) {
    res.status(500).send(error.message);
  }
}

//registrar um like
export async function postLike(req, res) {
  const { userId, postId } = req.body;

  try {
    await likeRepository(userId, postId);
    res.sendStatus(200);
  } catch (error) {
    res.status(500).send(error.message);
  }
}

//deletar o like
export async function deleteLike(req, res) {
  const { userId, postId } = req.body;

  try {
    await deslikeRepository(userId, postId);
    res.sendStatus(202);
  } catch (error) {
    res.status(500).send(error.message);
  }
}
