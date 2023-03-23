import joi from "joi";

export const likeSchema = joi.object({
  userId: joi.number().integer().required(),
  postId: joi.number().integer().required(),
});
