export class ServerError extends Error {
  code: number;

  constructor(message: string, code: number) {
    super(`${message} (${code})`);
    this.name = "Server Error";
    this.code = code;
  }
}
