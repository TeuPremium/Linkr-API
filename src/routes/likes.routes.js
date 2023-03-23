import { Router } from "express";
import {
  deleteLike,
  getLikes,
  postLike,
} from "../controllers/like.controllers.js";
import { schemaValidate } from "../middlewares/schema.validate.js";
import { likeSchema } from "../schemas/like.schema.js";

export const likeRouter = Router();

likeRouter.get("/likes/:postId", getLikes);
likeRouter.post("/likes", schemaValidate(likeSchema), postLike);
likeRouter.delete("/likes", schemaValidate(likeSchema), deleteLike);
