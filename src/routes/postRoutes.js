
import { Router } from "express";
import { addPost, deletePost } from "../controllers/post.controllers.js";
import { schemaValidate } from "../middlewares/schema.validate.js";
import { postSchema } from "../schemas/post.schema.js";

export const postRouter = Router()

postRouter.post("/posts", schemaValidate(postSchema), addPost)
postRouter.delete("/posts", deletePost)