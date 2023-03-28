import { Router } from "express";
import { addPost, deletePost, editPost, getPost, getUserPosts } from "../controllers/post.controllers.js";
import { schemaValidate } from "../middlewares/schema.validate.js";
import { postSchema } from "../schemas/post.schema.js";

export const postRouter = Router();

postRouter.post("/posts", schemaValidate(postSchema), addPost);
postRouter.delete("/posts/:id", deletePost);
postRouter.get("/posts/:limit?", getPost);
postRouter.get("/user/:id", getUserPosts);
postRouter.put("/posts/:id", editPost)
