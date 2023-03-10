import joi from "joi";

export const postSchema = joi.object({
  userId: joi.number().required(),
  url: joi.string().uri().required(),
  comment: joi.string().empty(""),
});
