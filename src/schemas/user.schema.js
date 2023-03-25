import joi from "joi";

export const userSchema = joi.object({
  username: joi.string().min(3).required(),
});
