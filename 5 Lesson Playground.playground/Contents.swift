import Cocoa

func separator (task: Int) {
    print("\n_________ დავალება #\(task)_________\n")
}
//1. შექმენით მასივი `fruits`, რომელიც შეიცავს 5 ხილის სახელს. გამოიყენეთ `forEach` მეთოდი, რომ დაბეჭდოთ თითოეული ხილის სახელი ცალ-ცალკე ხაზზე.
separator(task: 1)

let fruits = ["Apple", "Banana", "Orange", "Mango", "Grape"]

for fruit in fruits {
    print(fruit)
}

//2. დაწერეთ ფუნქცია `filterEvenNumbers`, რომელიც იღებს Int-ების მასივს და იყენებს `filter` მეთოდს, რომ დააბრუნოს ახალი მასივი მხოლოდ ლუწი რიცხვებით. გამოიძახეთ ეს ფუნქცია სხვადასხვა მასივებზე და დაბეჭდეთ შედეგები.
separator(task: 2)

func filterEvenNumbers(numbers: [Int]) -> [Int] {
    return numbers.filter { $0 % 2 == 0 }
    }

let numbers1 = [1, 2, 3, 4, 5, 6, 7, 8, 8]
let numbers2 = [12, 23, 34, 45, 56, 67, 78, 89]

print(filterEvenNumbers(numbers: numbers1))
print(filterEvenNumbers(numbers: numbers2))

//3. დაწერეთ ფუნქცია sumOfUniqueSquares, რომელიც იღებს Int-ების მასივს, გადააქცევს მას Set-ად (რომ მოაშოროს დუბლიკატები), შემდეგ იყენებს map მეთოდს ყველა ელემენტის კვადრატში ასაყვანად, და ბოლოს reduce მეთოდს ჯამის გამოსათვლელად. გამოიძახეთ ეს ფუნქცია სხვადასხვა მასივებზე და დაბეჭდეთ შედეგები.
separator(task: 3)

func sumOfUniqueSquares(massive: [Int]) -> Int{
    let arrayToSet = Set(massive)
    let squaredNumbersSet = arrayToSet.map { $0 * $0 }
    let sum = squaredNumbersSet.reduce(0)
    { (result, number) in
        return result + number
    }
    return sum
}

print(sumOfUniqueSquares(massive: numbers1))
print(sumOfUniqueSquares(massive: numbers2))

//4. შექმენით ორი Set fruitsA და fruitsB, რომელებიც შეიცავენ ხილების სახელებს (ზოგიერთი ხილი შეიძლება გვქონდეს ორივე სეტში). გამოიყენეთ Set-ის ოპერაციები (union, intersection, symmetricDifference) და forEach მეთოდი, რომ დაბეჭდოთ: 1) ყველა უნიკალური ხილი ორივე სეტიდან 2) ხილები, რომლებიც ორივე სეტში გვხვდება 3) ხილები, რომლებიც მხოლოდ ერთ სეტშია
separator(task: 4)

let fruitsA: Set = ["Apple", "Banana", "Orange", "Mango", "Grape"]
let fruitsB: Set = ["Kiwi", "Pineapple", "Papaya", "Mango", "Grape"]

fruitsA.symmetricDifference(fruitsB).forEach { fruit in
    print(fruit)
}
print("\n")

fruitsA.intersection(fruitsB).forEach { fruit in
    print(fruit)
}
print("\n")

fruitsA.subtracting(fruitsB).forEach { fruit in
    print(fruit)
}

//5. შექმენით ორგანზომილებიანი მასივი `matrix`, რომელიც შეიცავს რამდენიმე Int მასივს. გამოიყენეთ `flatMap` მეთოდი, რომ გადააქციოთ ის ერთგანზომილებიან მასივად. დაბეჭდეთ ორიგინალი მატრიცა და მიღებული ბრტყელი მასივი.
separator(task: 5)

let matrix = [
[1, 2, 3, 3, 4, 5],
[4, 5, 6, 7, 8, 9],
[1, 2, 3, 4, 5, 6]
]

let flatMatrix = matrix.flatMap { $0 }

print(matrix)
print(flatMatrix)

//6. დაწერეთ ფუნქცია `processOptionalNumbers`, რომელიც იღებს `[Int?]` ტიპის მასივს (ოფციონალური Int-ების მასივი). გამოიყენეთ `compactMap`, რომ მიიღოთ ახალი მასივი, სადაც ყველა nil მნიშვნელობა მოშორებულია და დანარჩენი რიცხვები გაორმაგებულია. გამოიძახეთ ფუნქცია და დაბეჭდეთ შედეგი.
separator(task: 6)

func processOptionalNumbers(arrayOpt: [Int?]) -> [Int] {
    return arrayOpt.compactMap { $0 != nil ? $0! * 2 : nil}
    }
var arrayOpt = [nil, 1, 2, 3, nil, 10]
print(processOptionalNumbers(arrayOpt: arrayOpt))

//7. შექმენით ორი სხვადასხვა ტიპის მასივი: `names` (String-ების მასივი) და `ages` (Int-ების მასივი). გამოიყენეთ `zip` ფუნქცია ამ ორი მასივის გასაერთიანებლად, შემდეგ კი `sorted` მეთოდი, რომ დაალაგოთ მიღებული კოლექცია ასაკის მიხედვით. დაბეჭდეთ შედეგი.
separator(task: 7)

let names = ["Ana", "Sergo", "Vika", "Nika"]
let ages = [25, 30, 7, 14]

let combined = zip(names, ages)
let sortedByAge = combined.sorted { $0.1 < $1.1 }
print(sortedByAge)

/*8. დაწერეთ ფუნქცია `groupWordsByLength`, რომელიც იღებს String-ების მასივს და იყენებს `reduce` მეთოდს, რომ დააჯგუფოს სიტყვები მათი სიგრძის მიხედვით Dictionary-ში. გამოიძახეთ ეს ფუნქცია სხვადასხვა სიტყვების მასივზე და დაბეჭდეთ შედეგი.

მაგალითად: input: ["apple", "banana", "kiwi", "grape", "strawberry"]

output: [4: ["kiwi"], 5: ["apple", "grape"], 6: ["banana"], 10: ["strawberry"]]*/
separator(task: 8)

func groupWordsByLength(words: [String]) -> [Int: [String]] {
    return words.reduce(into: [Int: [String]]()) {result, word in
        let length = word.count
        result[length, default: []].append(word)
    }
}
print(groupWordsByLength(words: fruits))
print(groupWordsByLength(words: names))
