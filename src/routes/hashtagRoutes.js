import { Router } from "express";
import { tagPosts } from "../controllers/hashtags.controller.js";
import { getRank } from "../middlewares/rankHashtag.js";

export const hashtags = Router()

hashtags.get('/rank', getRank)
hashtags.get('/hashtag/:hashtag', tagPosts)