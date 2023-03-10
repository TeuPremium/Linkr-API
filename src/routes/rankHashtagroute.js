import { Router } from "express";
import { getRank } from "../middlewares/rankHashtag.js";

export const hashtagRank = Router()

hashtagRank.get('/rank', getRank)