import UIKit
//const
let Str:String = "test"
//variable
var str:String = "Hello, playground"

let min = UInt8.min
print(min)
let max = UInt8.max
print(max)
//Uint = unsign int

//If we don't specify a type of a float =>swift default set it as double, whatever you + an int

let pi = 3.14 // double
let Pi:Float = 3.14 // float

//different method to set a number,some need set the prefix
//int => no prefix
let test_int = 17

//binary with 0b
let binary_int = 0b10001
print(binary_int)
//octal with 0o
let octal_int = 0o21
print(octal_int)
//hex with 0x
let hex_int = 0x11
print(hex_int)

let test:UInt16 = UInt16.max
print(test)

let a:UInt16 = 2_000 // 2000
let b:UInt8 = 1
let result = a + UInt16(b)
print(result)

//typealiases = type def
typealias type = Int
var int_test:type = 5
print(int_test)

typealias type2 = String
var str_type:type2 = "HelloWorld"
print(str_type)

//tuple not need same type
//(String ,int ,Bool) OK!

let error_message = (500,"Not Found")
//type (Int,String)

//Get value from a tuple
//if u want to get all elements in tuple -> set the same variable as tuple elements
let(error_code,error_messages) = error_message
print(error_code)
print(error_messages)

//if u just want some variable ,set unuse variable to _
let(error_c ,_) = error_message
print(error_c)

//get tuple elements with index
print(error_message.0)
print(error_message.1)

//get tuple elements with elements
//but need to set the individual elements first
let ResultCode = (reuslt_code:500,result_message:"Not Found")
print(ResultCode.result_message)
print(ResultCode.reuslt_code)

//optionals
//? can be nil or having a value
//! must have a value if nil -> error

var change:Int? = 99999
var tst:String! = "hi"

//If

if(change != nil){
    print("my number is \(String(describing: change))")
}
else{
    print("Not found")
}

//Optional Bingding if/while '?'
var myNum:Int? = 55
if let newvalue = myNum{
    print("my number is \(newvalue)")
}
else{
    print("Number is nil")
}

//if optianl is not nil(right not need to set ? ) -> assign to the new variable(left) using in if branch
let myvalue:Int? = Int("999")

if let testvalue = myvalue{
    print(testvalue)
}

//multi optional using coma
if let first = Int("30"),let second = Int("40"),first <= 30 && second <= 40 {
    print(first + second)
}

let test1:String? = "Hello"
let test2:String? = nil


if let value1 = test1 ,let value2 = test2{
    print(value1 + value2)
}
else{
    print("None")
}


//Implicitly Unwarapped Optionals '!'

var my_str:String? = "HelloWorld"
let new_value:String = my_str!

//DON"T USE Implicitly Unwarapped Optionals in a variable becoming nil

//ERROR HANDING DO-TRY_CATCH
//Example:
enum Account:Error{ // this enum is Error type
    case ACCOUNT_NOT_EXIST
    case PASSWORD_IN_CORRECT
}

func Login(_ account:String,_ password:Int)throws{
    if(account == "admin"){
        if(password == 123){
            print("welcome")
        }
        else{
            throw Account.PASSWORD_IN_CORRECT
        }
    }
    else{
        throw Account.ACCOUNT_NOT_EXIST
    }
}

func message(){
    print("what can i help you?")
}


do{
    try Login("admin",123)
    message()
}catch Account.ACCOUNT_NOT_EXIST{
    print("your account doesn't exist")
}catch Account.PASSWORD_IN_CORRECT{
    print("your password isn't correct,try again")
}

//Assertions and Preconditions (Help debug -> if a invalid assumptions occurs -> end the program(does't have any error code unliky error handing))
//Assertions :Debug builds
//Precindition: Debug builds and production builds
//IN production builds Asserstion won't evaluated
//condition :True / False

//USING ASSERTIONS - func assert with a conditions (true or false) and a message(while false happened)

//Conditions + error messages
let age = 30
assert(age >= 0 && age <= 100, "your age is greater than 100")

//Conditions only
assert(age >= 5)

//check the condition already just assertions message
if(age >= 20 && age < 30) {
    print("Hi little boy")
}
else if(age >= 30 && age <= 50){
    print("i realise you are old!")
}
else{
    assertionFailure("You are out of range of age")
}

//assert(con,mess)
//assert(con)
//assertionFailure(mess)
//ASESERTION run in debug
//Build config Debug:optimization level = No optimization
//IF in release model won't work => optimization level = optimization level : optimaization for speed


let index:Int = 1
precondition(index > 0,"index must > 0")

let Result:Int = 51
//suppose in released app
switch Result {
case 0...60:
    print("oh you are failed!")
case 61...80:
    print("oh you done well!")
case 81...100:
    print("oh!!!! Got A grade!!")
default:
    preconditionFailure("You result is out of range")
}


func testError(){
    fatalError("Unimplement func")
}
//fatalError() -> work in release and debug model
//but it use in unimplements function to remind debeloper
//testError()


//assign with tuple
let (A , B) = (10,5)
print(A)
print(B)

//if x=y is not valid in swift (help us)

//+ - * /
//String:
let str1:String = "Test"
print(str1 + "123")

//Unary + -
var Value:Int = 3
var TestInt = -Value
var TestInt2 = -TestInt
//(-) = *-1
print(TestInt)
print(TestInt2)
//(+) = *+1 unchange

print(+Value)

//Comparison Operators (== != < > <= >=)
print(1 == 1)
print(2 != 1)
print(2 > 1)
print(0 < 1)
print(2 >= 1)
print(0 <= 1)

//Comparsion with a tuple if they have same type and same number of value
//if having one comparsion is ture,no mater other is false or ture
print((1,"a") < (2,"b"))
print((1 , "z")>(0 , "a"))//z > a
print((2,"Jackson") == (1,"Xd")) //2!= 1 jackson != Xd
print((1,"D") == (1,"D"))
print("abcd" < "adbc")

//Ternary Conditional Operator
//a > b ? a(true):b(false)

let sarayperday:Int = 30
let hpm:Int = 10
let Saray:Int = 30 * (hpm > 24 ? (hpm * 2) :hpm)
print(Saray)


//Nil-Coalescing operator
//if left is not nil ,return left variable else return right variable
//left variable must be a optional

let color:String = "Red"
var MyColor:String? //default as nil

//Using nil
let NewColor:String = MyColor ?? color
print(NewColor)

MyColor = "Blue"
let mynewcolor:String = MyColor ?? color
print(mynewcolor)

//Range (a...b) a to b closed Range

for i in (0...5){
    print(i)
}
print("\n")
var list:[Int] = [0,1,2,3,4]

//closed
for i in 0...list.count-1{
    print(list[i])
}
//half-open a..<b
for i in 0..<list.count{
    print(list[i])
}

var Newlist:[Int] = [Int]()
for i in (0...10){
    Newlist.append(i*10)
}

print(Newlist)
//One-Sided in a list : list[2...] index 2 to end of list
//One-Sided in a list : list[...2] index start to 2

for i in Newlist[...5]{ //0 1 2 3 4 5
    print(i)
}

for i in Newlist[5...]{ //5 6 7 8 9 10
    print(i)
}

for i in Newlist[..<5]{ // 0 1 2 3 4
    print(i)
}

//Check One-side contains a particular value
let range = ...5 //all value before 5 are contained
print(range.contains(0))
print(range.contains(5))
print(range.contains(-5))
print(range.contains(6))

//other operator && || !

//String and CHaracters
//String Literals

let Str_1:String = "Hello world"
let Str_2:String = "Hello world2"

//if we need a string with several lines using """ rather than "
//Everything within """(open)  """(close) before close will be stored in the the constant or varable ,except escape(\)

let mutil_str = """
Today, i am learning swift \
and i am listening to some rap while i am learning. \
"That all what i did today"
"""
//using (\) in multiline string literal at the end of the line break
//it make our source code easy to read, but in string still be a one line not having any line break

//if we want to make a line break in string ,just jump to new line
print(mutil_str)


let mutil_str_2:String = """

"hi","WHat?"
"Nothing,just say hi to you"


"""
//let the first line and end lind feed
print(mutil_str_2)

//if our text is align to the closing quotation marks(""")
//switf will ignored the space before the your text
//otherwise the space will apperas in your string
let space_string:String = """
    Spaces before this line won't be appeared in string
        But space before this line ,arround 2 space will be appeared in string
    This line same as line one,swift will ignore the space before the closing quotation marks
    
    """
print(space_string)
//like this (s stand for space)
//xxxxxxxxxxxxxx
//|s|s|xxxxxxxxxxxx
//xxxxxxxxxxxxxx
//"""

//Using Speical Characters in String Literals
// \0(null) \\(backslash) \t(Horizontal tab)
// \n(line feed) \r(enter) \" (double quotation mark)
// \' (sigle quotation mark)
// **Using unicode value \u{n} n:1-8digit hex
// conclusion: any speical syntax add \ can appears in string(like "" ' """ etc)


let test_str_1:String = "Hi\t1"
print(test_str_1)
let test_str_2:String = "hi\\ \" test \' "
print(test_str_2)
let str_unicode_1:String = "\u{21}"
let str_unicode_2:String = "\u{2668}"
let str_unicode_3:String = "\u{1F486}"
let string_test:String = """
\"""
\"\"\"
"""


//if we want to appear speical character in string add '#'before opening quotation mark and after closing quotation mark

let Speical_char:String = #"""
\n \t \0 \#n
\n{26}
"""#
print(Speical_char)
//if we want to use those speical character in ## stirng add #between / and n/t/etc
//eg: /#n ->break the line

//Init String
//method 1
var init_Str:String = ""
var init_Str2:String = String()

if (init_Str.isEmpty){
    print("1:method 1 is empty")
}

if(init_Str2.isEmpty){
    print("2:method 2 is empty")
}

//assign and add a string to a variable using + /+=
//constans can't be modified
var assign_str = "Hello"
assign_str += "world"
//add a char/string to string
let char:Character = "!"
assign_str.append(char)
assign_str.append("test")
print(assign_str)
//+ only work with string
//want to add a char to string using string.append(char)

//passing string to method or assign to a new var or cons => copy!!

//String is a character array
//Using for loop to get string iterral

for char in "Hello World"{
    print(char)
}

//we can construct a string with a character array
let charArray:[Character] = ["H","e","l","l","o"] // character array
//casting to string
let Str_charArray:String = String(charArray)
print(Str_charArray)

for i in charArray{
    print(i)
}

//add a string to the end line of string which's using mutil quotation mark
//Example 1:
var Str_mutil:String = """
one
two
"""

let add_str:String = "three"

Str_mutil += add_str
print(Str_mutil)

// add to the last line
// do not have a line break
//if we want to add to a new line -> need to let the mutil(""" ) String haveing a line feed first-> it will be able to add to a new line

var Str_mutil_2:String = """
one
two

"""

Str_mutil_2 += add_str
print(Str_mutil_2)

//String interpolation
//allow us to add constants or variable etc to a string
//Sytax: backslash + a pair of paraentheses \(variable)
//single-line string or mutil line string

let number_1:Int = 5
let result_str:String = "the number is \(number_1)"
print(result_str)

let result_Str2:String = """
* = \(Double(number_1) * 2.5)
+ = \(number_1 + number_1)
"""

//Using # to appear \ thing in string
//add # before \ be able to use that sytax
let str_test:String = #"we can use \(variable) to appear a constant or varable"#
let str_test2:String = #"our number is \#(number_1) !"#


//we can use unicode character to store a complex character like chinese
let uChar:Character = "\u{D55C}"
let uCharCombine:Character = "\u{1112}\u{1161}\u{11AB}"
//we can use one or more unicode to make a character

let uCharacter:Character = "\u{E9}"
let uCharacter2:Character = "\u{20DD}"
let CombinChar:Character = "\u{E9}\u{20DD}"
let regional:Character = "\u{1F1FA}\u{1F1F8}"
//etc

//using count to count the the char in string
//But if using extended grapheme clusters for character value
//may not affect a string character count
let clusters:String = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print(clusters.count)

//using extended grapheme clusters
let extended:String = "Cafe\u{301}"
print(extended)
print(extended.count)
//in this case ,the last character is not e ,e is replaced by é
//count = 4 not 5
//** if we using different representation of the same character
//if can require different amounts of memory to store

//Accessing and Modeifying a String
//get substring using index method(startIndex,endIndex,Index(after:),Index(before:)
//access an index farther away from given index Index(_:offsetBy:) return index+ offset


let IStr:String = "Index Testing"
IStr[IStr.startIndex]
IStr[IStr.index(before: IStr.endIndex)]
IStr[IStr.index(after: IStr.startIndex)]
IStr[IStr.index(IStr.startIndex, offsetBy: 4)] //1+4 = 5 Str[5-1] =x
//** Don't out of range
//Str[Str.endIndex] => out of range it must endIndex -1 for the last character
//Str[Str.Index(after:Str.endIndex)] -> out of range

for i in IStr{
    print(i) // can get the character in str
}

//if want to get the indices ->use str.indices
for i in IStr.indices{ // return the index
    print("\(IStr[i])")
}

//Insert and remove
//Insert a char => str.insert("x",at:str.Index)
//Insert a substring => str.insert(contentsOf:"",at:index)

var InsertStr:String = "Hello World"
//insert a char
InsertStr.insert("!",at: InsertStr.endIndex)
print(InsertStr)
InsertStr.insert("🐨", at: InsertStr.index(before: InsertStr.endIndex))
print(InsertStr)
InsertStr.insert("🐌", at: InsertStr.index(InsertStr.startIndex, offsetBy: 5))
print(InsertStr)

//Insert a substring
var InsertStr2:String = "Hello World"
InsertStr2.insert(contentsOf: " Hello", at: InsertStr2.endIndex)
print(InsertStr2)
InsertStr2.insert(contentsOf: " Test ", at: InsertStr2.index(after: InsertStr2.startIndex))
print(InsertStr2)
InsertStr2.insert(contentsOf: "🐨🐨🐨🐨", at: InsertStr2.index(InsertStr2.endIndex, offsetBy: -4))
print(InsertStr2)


//remove a char => str.remove(at:index)
//remove a substring => str.removeSubrang(range)
var RemoveStr:String = "Hello World"
RemoveStr.remove(at: RemoveStr.startIndex)
RemoveStr.remove(at: RemoveStr.index(before: RemoveStr.endIndex))
RemoveStr.remove(at: RemoveStr.index(RemoveStr.startIndex, offsetBy: 5))
print(RemoveStr)

//Remove substring
var RemoveStr2:String = "Hello World"
let range1 = RemoveStr2.index(RemoveStr2.endIndex, offsetBy: -5) ..< RemoveStr2.endIndex
RemoveStr2.removeSubrange(range1)
print(RemoveStr2)

RemoveStr2.insert(contentsOf: " Program swift", at: RemoveStr2.index(before: RemoveStr2.endIndex))
print(RemoveStr2)

let range2 = RemoveStr2.startIndex ..< RemoveStr2.index(RemoveStr2.startIndex, offsetBy: 6)
RemoveStr2.removeSubrange(range2)
print(RemoveStr2)

//***
//In swift storting a string has a region of memory where character are storted
//If we want to make a substring from the original string
//In the case we aren't creating a new string to store substring-> it will reuse the memory address of the part of substring which menmory address are Original string used
//But if we get the substring from original string and assign with string type
//That is not a substring,it's a new string,it'll take other memory to store them
//Exmaple:
//Hello World(add:0x0123456789AB) -> String
//Subtring(instance of string)[Hello] (add:0x01234)-> address is reused
//If : sub:String = String(substring) => take other memory add to store (add:;0x9512...)
//Not reused original string add
//string func = substring func (following StringProtocol)
//***
let substring:String = "Hello,world"
let i = substring.firstIndex(of: ",") ?? substring.endIndex
//return a index in string of a character
let newSub = substring[..<i]
print(newSub)
//Reusing original string memory -> substring type

let newString = String(newSub)
// a new string not relative to any string
print(newString)

//string and character comparing
let compasingStr_1:String = "Hello world!🐨🐨"
let compasingStr_2:String = "Hello world!🐨🐨"
let compasingChar_1:Character = "🐨"
let compasingChar_2:Character = "W"

if compasingStr_1 == compasingStr_2{
    print("we are same")
}
else{
    print("oss,suck")
}

if compasingChar_1 == compasingChar_2 {
    print("we have same character")
}
else{
    print("we are not same")
}

//We only can compare a string make up with Extended grapheme clusters
//Ture: they are cannoically equivalent
//Cannoically equivalent = same linguistic meaning(same language) and same appearance
//like english "A" and Russian "A"->Althouh they have the same appearance but they aren't same linguistic ->false

let ExtendedGC_1:String = "Caf\u{E9}"
let ExtendedGC_2:String = "Caf\u{65}\u{301}"
print(ExtendedGC_1)
print(ExtendedGC_2)
//they haven't the same Extended Grapheme clusters
//But they are same liguistic meaning and appearance é
if ExtendedGC_1 == ExtendedGC_2{
    print("We are the same")
}
else{
    print("WE aren't the same")
}

let ExtendedGC_3:Character = "\u{41}"
let ExtendedGC_4:Character = "\u{410}"
print(ExtendedGC_3)
print(ExtendedGC_4)
//They aren't the same linguistic
if ExtendedGC_3 == ExtendedGC_4{
    print("We have same character")
}
else{
    print("We haven't the same character")
}

//String prefix and suffix
let StrArray:[String] = [
"Act 1:Jackson",
"Act 1:Tom",
"Act 1:Account",
"Act 2:Tesing",
"Act 3:Tony"
]

var count = 0
for Act in StrArray{
    if Act.hasPrefix("Act 1 "){
        count += 1
    }
}
// hasPrefix -> check string from index 0 is euqal to index 0 of your tring you want to find ,true i++,keep checking
// Stirng : Act 1 ,isPrefix("Act 1"), A==A,++ c==c ++ t==t ++ \0 == \0 ++ 1==1 ->true
// String : Bct 1 ,isPrefix("Act 2") B!= A -> false
//Using char by char (canonical quivalence if and only if same language system and appearance)
print(count)
var on = 0
var ct = 0
for name in StrArray{
    if(name.hasSuffix("on")){
        on += 1
    }
    else if name.hasSuffix("ing"){
        ct += 1
    }
}
print(on)
print(ct)
//hasSuffix = check your string started at the endIndex
//hasPrefix = check your string started at the startedIndex

//access string / character with unicode-8/16/32 using for-in
//String provided a func call utf-8 to access the character code with utf encoder
let utfStr:String = "Dog\u{203C}\u{1F436}"

//UTF-8
for utf8 in utfStr.utf8{
    print("UTF-8:\(utf8)")
    print(" ")
}
// utf8 :68(D) 111(O) 103(G) |226 128 188|(!!) |240 159 144 182|(dog emoji)


//UTF-16
for utf16 in utfStr.utf16{
    print("UTF-16:\(utf16)")
    print(" ")
}

//utf-16:68(D) 111(O) 103(G) 8252(!!) |55357 56374|(Dog emoji)

//UTF-32 (in swift return 21's bit )
for utf32 in utfStr.unicodeScalars{
    print("UTF-32:\(utf32)")
    print(" ")
}
//using unicodeScalars ->return a character directly
//Dog!!🐶


//Collection Types
//Swift:Array(ordered),set(unordered),dict(unordered with a key) with a generic type


//2 method to create an array : Array<type> or shorthand form [type](preferred)

//inti array with int type
var array:[Int] = [Int]()
var array2 = Array<Int>()

for i in 0...10{
    array.append(i+10)
    array2.append(i+9*5)
}
print(array)
print(array.count)
print(array2)
print(array2.count)

//create a new array with default value(same value with n size)
//using array(repeating:,count:)

var Arr = Array(repeating: 10, count: 10) //type:Int
var Arr2 = Array(repeating: "Test", count: 10) //type:String
var Arr3 = Array(repeating: Float(0.5), count: 10)//type:Double
//In those case,creating an array using Array(repeating:) ->type what repeating value u have set as default

var ArrInt = Array<Int>()
for i in 0..<10{
    ArrInt.append(i+5)
}
print(ArrInt)

var ArrStr = Array<String>()
for i in 0..<5{
    ArrStr.append("Test\(i)")
}
print(ArrStr)

var ArrFloat = Array<Float>()
for i in 0..<10{
    ArrFloat.append(Float(i) + 0.5)
}
print(ArrFloat)

//We can create an array by adding 2 array (+)

var NewIntArr = Arr + ArrInt
print(NewIntArr)

var NewStringArr = Arr2 + ArrStr
print(NewStringArr)

var NewFloatArr = Arr3 + ArrFloat
print(NewFloatArr)

//Create an array with an Array Literal(shorthand form)
var ShorthandArr:[Int] = [1,2,3]
var ShorthandArr2:[String] = ["test","test1","test1"]
//etc...
//if we init in such way no need to set array type


//modify an array
//.count (elements in array)
//.empty(check array.count == 0?)
//.append(elements) push a elements to the end of the array
    //or using += to push one or more elements to array
//Retrieve a value using index
//Change the value using index
//Retrieve and change array with for loop
//Replacing elements by index range
//.insert(element,at:_)
//insert elements at the end of array: insertList() Xinset(,at:)
//remove a elements at specify index : remove(at:)

var ModifyArray = [1,6]
print(ModifyArray.count)
if ModifyArray.isEmpty{
    print("Your array is empty")
}
else{
    print(ModifyArray.count)
}

ModifyArray.append(15)
ModifyArray.append(6)
ModifyArray.append(9)
ModifyArray.append(99)
print(ModifyArray)

ModifyArray += [18]
ModifyArray += [32,45,69]
ModifyArray += [55,66,88,44,111]
print(ModifyArray)

//******************
//Any elements is appended to array, whatever what order you pushed in,array will sort automaticly
//******************


let firstValue = ModifyArray[0]
print(firstValue)
print(ModifyArray.count)

let Arrrange = ModifyArray.index(0, offsetBy: 5)...ModifyArray.index(before: ModifyArray.endIndex)
ModifyArray[Arrrange] = [100,200,300]
print(ModifyArray)
//string and array index not the same  string index = INDEX type , array is INT type
ModifyArray[0] = 0
print(ModifyArray)

for i in 0..<10{
    print(i)
}


ModifyArray.insert(-1, at: 5)
print(ModifyArray)

ModifyArray.insert(988, at: ModifyArray.endIndex - 1)
ModifyArray.insert(666, at: ModifyArray.index(5, offsetBy: 5))
ModifyArray.insert(123, at: ModifyArray.index(after: ModifyArray.startIndex))
print(ModifyArray)

ModifyArray.remove(at: ModifyArray.startIndex)
ModifyArray.remove(at: ModifyArray.index(ModifyArray.startIndex, offsetBy: 10))
ModifyArray.remove(at: ModifyArray.endIndex - 1)//remove the last elements
ModifyArray.removeLast() // remove the last elements
print(ModifyArray)
//If we want to get index and value in array ->.enumerated()(return a tuple with index and value)

for (index , value) in ModifyArray.enumerated(){
    print("\(index + 1) : \(value)")
}
print("\n")
let EmuStr = ["Tom","Jackson","Tony","Jack","Tommy","Ken","WokenDay"]
for (index ,name) in EmuStr.enumerated(){
    print("\(index + 1) : \(name)")
}

var EnumInt = [1,2,6,99,55,56,98,112,5556]
for (index,int) in EnumInt.enumerated(){
    print("\(index + 1) : \(int)")
}
print(EnumInt)
//set a list to empty
EnumInt = []
//all elelmets in EnumInt has been removed!
print(EnumInt)

//set
//set is similary to array
//if order isn't important -> use set
//set is following hashable(decode and encode) protocol

//delcare a set //set do not have shortland form
var Set_1 = Set<Int>() //
print(Set_1.count)

Set_1.insert(5)
Set_1.insert(10)
Set_1.insert(20)
Set_1.insert(30)
Set_1.insert(40)
Set_1.insert(50)
//no any order
print(Set_1)
print(Set_1.count)

//Set the set to empty same as array
Set_1 = [] //still of type Set<Int>
print(Set_1)

//Creata a set with array literal
var Set_2:Set<String> = ["English","Chinese","Japanese"]
print(Set_2)
//if we using the mehod above
//we no need to write what type is the set is
//But we need to explicitly it's a set using 'Set' keyword, otherwise it's a array declaration

//array
let TestingArray = [1,2,3] // Integer array
let TestingSet:Set = [1,2,3]//Integer Set

//acessing and modifying
//isEmpty,insert(elements),remove(elements){true = found,false = nil}
//removeAll()
//sorted() -> sorted the elements in set


var Set_str:Set = ["Tom","John","Tim","Jackson"]
Set_str.insert("Boom")
Set_str.insert("Tony")
Set_str.insert("Tommy")
Set_str.insert("Apple")

print(Set_str)

if let str = Set_str.remove("John"){
    print("\(str) is leaving")
}
else{
    print("we don't have that friend")
}

if let name = Set_str.remove("Jack"){
    print("\(name) is leaving")
}
else{
    print("we don't have that friend")
}
print(Set_str)

Set_str.sorted()
print(Set_str)
Set_str.remove(at: Set_str.index(after: Set_str.startIndex))
print(Set_str)

Set_str.removeFirst()
print(Set_str)

Set_str.removeAll()
print(Set_str)

var Set_Num:Set = [1,99,55,66,77,65]
//if Set having one or more same value-> Set won't be storted same value
print(Set_Num)

if Set_Num.contains(99){
    print("Hi")
}
else{
    print("~~Sorry")
}
//contains can check your set is contained a particular item,yes->return true ,else return false

if Set_Num.contains(88){
    print("yes")
}
else{
    print("~~Sorry")
}

Set_Num.removeAll()
print(Set_Num)

var Set_Int_2 = Set<Int>()

for i in 0..<20{
    Set_Int_2.insert(i*10)
}
print(Set_Int_2.sorted())
let Temp = Set_Int_2.sorted()
print(Temp)

for value in Temp{
    print(value)
}

for (index,value) in Temp.enumerated(){
    print("\(index + 1) is \(value)")
}

// Set opertations (Intersection,Difference,union,subtracting)
let oddDigits:Set = [1,3,5,7,9]
let evenDigits:Set = [2,4,6,8]
let primeNumbers:Set = [2,3,5,7]

print(oddDigits.union(evenDigits).sorted())
//[1,2,3,4,5,6,7,8,9]
print(oddDigits.intersection(primeNumbers).sorted())
//[3,5,7]
print(oddDigits.symmetricDifference(primeNumbers).sorted())
//[1,2,9]
print(oddDigits.subtracting(primeNumbers).sorted())
//[1,9]

print(evenDigits.union(primeNumbers).sorted())
//[2,3,4,5,6,7,8]
print(evenDigits.intersection(oddDigits).sorted())
//[]
print(evenDigits.symmetricDifference(primeNumbers).sorted())
//[3,4,5,6,7,8]
print(evenDigits.subtracting(oddDigits).sorted())
//[2,4,6,8]

print(primeNumbers.union(evenDigits).sorted())
//[2,3,4,5,6,7,8]
print(primeNumbers.intersection(oddDigits).sorted())
//[3,5,7]
print(primeNumbers.symmetricDifference(oddDigits).sorted())
//[1,2,9]
print(primeNumbers.subtracting(evenDigits).sorted())
//[3,5,7]

// relationship of set (subset super disjoint)
//== same set,isSubset(set) isSuperset(set),isDisjoint(set)
//isStricSubset / isStrictSupers(check a set is subset or superset of a set,but not equal to the set)
//isSubset /isSuper(may be 2 set are same)

let hourseAnimals:Set = ["🐶","🐱"]
let farmAnimals:Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals:Set = ["🐦", "🐭"]


//subset
print(hourseAnimals.isSubset(of: farmAnimals))
print(hourseAnimals.isSubset(of: hourseAnimals))
print(hourseAnimals.isStrictSubset(of: hourseAnimals))// they are the same->false
//superset
print(farmAnimals.isSuperset(of: hourseAnimals))
print(farmAnimals.isSuperset(of: farmAnimals))
print(farmAnimals.isStrictSuperset(of: farmAnimals))// they are the same-> false
print(farmAnimals.isSuperset(of: cityAnimals)) //they are disjoint
//disjoint
print(cityAnimals.isSuperset(of: hourseAnimals))//disjoint
print(cityAnimals.isSubset(of: farmAnimals))//disjoint
print(cityAnimals.isDisjoint(with: farmAnimals))
print(cityAnimals.isDisjoint(with: hourseAnimals))
print(cityAnimals.isSuperset(of: cityAnimals))
print(cityAnimals.isSubset(of: cityAnimals))
print(cityAnimals.isStrictSuperset(of: cityAnimals))//they are same
print(cityAnimals.isStrictSubset(of: cityAnimals))//they are same

print(hourseAnimals == farmAnimals.intersection(hourseAnimals))

//Dictionary
//Create a empty Dict Dictionary<type,type>
var Dict_1 = Dictionary<Int,String>()
if Dict_1.isEmpty{
    print("empty")
}

var Dict_2 = [Int:String]()
if Dict_2.isEmpty{
    print("empty")
}

//insert elements to a dictionary
Dict_2[0] = "Test"

Dict_2[10] = "Check"
Dict_2[65] = "TA"
Dict_2[99] = "Yoyoyo"
print(Dict_2)
//set a dict to empty ,same as array but need to add a colon
Dict_2 = [:]
print(Dict_2)

//create a Dictionary with a Dictionary Literal
let Dict_3:[String:String] = ["HKC":"HongKong","TWC":"Taiwan"]
//if we using this way to create ,not need to the type:type,but be sure [type1:type2,type1:type2...],type is the same for each element, shorthand form
//same as array
let Dict_4 = ["HKC":"HongKong","TWC":"Taiwan"]

//add a new elements and change to value
//using the key or updateValue(:)->return a oldvalue(optional,maybe nil) change the value

var Name = Dictionary<Int,String>()
var school_in_HK = ["TW":"LPSS","SWK":"S.W.k"]

//insert new value to school
Name[0] = "Jackson"
Name[1] = "Tom"
Name[2] = "Timmy"
Name[4] = "Tommy"
//change the value
Name[0] = "Jack"
Name[4] = "Jason"

if let old_value = Name.updateValue("Jacky", forKey: 1){
    print(old_value)
}
else{
    print("key isn't exist")
}

if let old_value = Name.updateValue("Brain ", forKey: 10 ){
    print(old_value)
}
else{
    print("Key isn't found")
}

if let old_value = Name.updateValue("Tony", forKey: 2){
    print("Your old vale for key 2 is \(old_value)")
    if let new_value = Name[2]{
        print("New value is \(new_value)")
    }
}
else{
    print("Key not found")
}

//Retrieve a value form Dictionary using [key](optional) ->might be not exist
school_in_HK["ABC"] = "ABCSchool"
school_in_HK["DFF"] = "DFFSchool"
school_in_HK["HJC"] = "JCS"
school_in_HK["BNS"] = "BNS"

if let value = school_in_HK["ABC"]{
    print(value)
}
else{
    print("NOT FOUND")
}

if let value = school_in_HK["HK"]{
    print(value)
}
else{
    print("NOT FOUND")
}

//remove and removValue(forkey:)
//like changing the value,but assign the value to nil->remove that key
school_in_HK["ABC"] = nil
school_in_HK["DFF"] = nil
school_in_HK["HJC"] = nil
school_in_HK["BND"] = nil
//All those key have been removed
print(school_in_HK)
school_in_HK.removeAll()
//Also can use removeValue to remove the key and value in dict

if let removed_value = Name.removeValue(forKey: 4){
    print("value \(removed_value) of key\(4) has been removed")
}
else{
    print("Key Not Found")
}

if let removed_value = Name.removeValue(forKey: 5){
    print("value \(removed_value) of key\(5) has been removed")
}
else{
    print("Key not found")
}

if let removed_value = Name.removeValue(forKey: 3){
    print("value\(removed_value) of ket\(3) has been removed")
}
else{
    print("Key NOT Found")
}

if let removed_value = Name.removeValue(forKey: 2){
    print("value\(removed_value) of ket\(3) has been removed")
}
else{
    print("Key NOT Found")
}

if let exist = Name[1]{
    print(exist)
    Name[1] = nil;
}
else{
    print("Key not found")
}
//ket 4 3 2 1has been removed
print(Name)
Name.removeAll()
//We can use iterating Over a Dictionary to retrieve key and value return a tuple(key,value)
//Using for-in loop

let stuedent_name:[String:String] = ["100":"Tom","200":"Jacky","300":"Cat","400":"Tony"]

//Retrieve a tuple of Dictionary
for (key,value) in stuedent_name{
    print("\(key):\(value)")
}

//we also can retrieve an collection of a dictionary's key or value by keys or values properties
for keys in stuedent_name.keys{
    print(keys) // a dictionary elements key type
}

for value in stuedent_name.values{
    print(value) // a dictionary elements value type
}

//We can also take an Array instance initialize a new array with keys or values
//Store dictionary elements keys or value to an array
let keysArray = [String](stuedent_name.keys)
print(keysArray)

let values = [String](stuedent_name.values)
print(keysArray)

var ResultSubject = Dictionary<String,Double>()
ResultSubject["Chinese"] = 60.0
ResultSubject["English"] = 59.8
ResultSubject["Math"] = 75.5
ResultSubject["L.S"] = 40.5
ResultSubject["I.C.T"] = 85.0
ResultSubject["Bio"] = 71.0
ResultSubject["Chem"] = 65.0
ResultSubject["Phy"] = 37.8

//all key and value in dict
for (subj, resultSub) in ResultSubject{
    print("Your subject \(subj) : Result:\(resultSub) ")
}

//all key of subj
for subject in ResultSubject.keys{
    print("Subject:\(subject)")
}

//all value of result
for subResult in ResultSubject.values{
    print("Subject Resuly : \(subResult)")
}

//Store key and value elements to array
let SubjectArr = [String](ResultSubject.keys)
print(SubjectArr)

let ResultSubjectArr = [Double](ResultSubject.values)
print(ResultSubjectArr)

ResultSubject.removeAll()

//Contorl Flow (LOOP)

