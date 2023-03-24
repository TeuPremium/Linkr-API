import { Router } from "express";
import {
  deleteLike,
  getLikes,
  postLike,
} from "../controllers/like.controllers.js";
import { authToken } from "../middlewares/auth.validate.js";
import { schemaValidate } from "../middlewares/schema.validate.js";
import { likeSchema } from "../schemas/like.schema.js";

export const likeRouter = Router();

likeRouter.get("/likes/:postId", getLikes);
likeRouter.post("/likes", authToken, schemaValidate(likeSchema), postLike);
likeRouter.delete("/likes", authToken, schemaValidate(likeSchema), deleteLike);
