
import { Router } from "express";
import { addPost } from "../controllers/post.controllers.js";
import { schemaValidate } from "../middlewares/schema.validate.js";
import { postSchema } from "../schemas/post.schema.js";

export const postRouter = Router()

postRouter.post("/post", schemaValidate(postSchema), addPost)