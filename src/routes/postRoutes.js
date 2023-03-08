
import { Router } from "express";
import { addPost } from "../controllers/post.controllers.js";

export const postRouter = Router()

postRouter.post("/post", addPost)