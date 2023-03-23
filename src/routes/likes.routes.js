import { Router } from "express";
import {
  deleteLike,
  getLikes,
  postLike,
} from "../controllers/like.controllers";

export const likeRouter = Router();

likeRouter.get("/likes", getLikes);
likeRouter.post("/likes", postLike);
likeRouter.delete("/likes", deleteLike);
