export class AppError extends Error {
  public statusCode: number;
  public status: string;

  constructor(message: string, statusCode: number) {
    super(message);
    this.statusCode = statusCode;
    this.status = `${statusCode}`.startsWith('4') ? 'fail' : 'error';
    Error.captureStackTrace(this, this.constructor);
  }
}

export class ValidationError extends AppError {
  constructor(message: string) {
    super(message, 400);
    this.name = 'ValidationError';
  }
}

export class AlreadyExistsError extends AppError {
  constructor(message: string) {
    super(message, 409);
    this.name = 'AlreadyExistsError';
  }
}

export class InvalidCredentialsError extends AppError {
  constructor(message: string) {
    super(message, 401);
    this.name = 'InvalidCredentialsError';
  }
}

export class ForbiddenError extends AppError {
  constructor(message: string) {
    super(message, 403);
    this.name = 'ForbiddenError';
  }
}

export class NotFoundError extends AppError {
  constructor(message: string) {
    super(message, 404);
    this.name = 'NotFoundError';
  }
}

export class InternalServerError extends AppError {
  constructor(message = 'Um erro inesperado ocorreu.') {
    super(message, 500);
    this.name = 'InternalServerError';
  }
}
