export type Result<T> = None | Some<T>;
export type AsyncResult<T> = Promise<Result<T>>;

export type None = ["none", string];
export type Some<T> = ["some", T];

export function some<T>(data: T): Some<T> {
  return ["some", data];
}

export function none(error: string): None {
  return ["none", error];
}

export function asome<T>(data: T): Promise<Some<T>> {
  return Promise.resolve(["some", data]);
}

export function anone(error: string): Promise<None> {
  return Promise.resolve(["none", error]);
}


export function panic<T>(error: string | T): error is T {
  console.error("error: paniced");
  console.error(error);
  process.exit(1);
}

