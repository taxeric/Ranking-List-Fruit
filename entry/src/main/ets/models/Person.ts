export class Person {
  private name: string
  private age: number

  constructor(name: string, age: number) {
    this.name = name
    this.age = age
  }

  public getInfo() : string{
    return 'name = ${this.name}'
  }

  public test() {
    let p = new Person("niuniu", 13)
    console.log(p.getInfo())
  }
}

