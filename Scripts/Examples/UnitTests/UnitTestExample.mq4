//+------------------------------------------------------------------+
//|                                              UnitTestExample.mq4 |
//|                            Copyright 2021, Diamond Systems Corp. |
//|                                       https://diamondsystems.org |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, Diamond Systems Corp."
#property link      "https://diamondsystems.org"
#property version   "1.00"

#include <DS/UnitTests/UnitTest.mqh>

class UnitTestNewBars: public UnitTest
{
   public:
      void  TestMain();
};

UnitTestNewBars cUnitTest;

//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
{
   cUnitTest.OnStart("TestClassA1");
}

//+------------------------------------------------------------------+
//| Test main                                                        |
//+------------------------------------------------------------------+
void UnitTestNewBars::TestMain()
{
   //--- variant 1
   Test_Construct("TestConstruct");
   //--- variant 2
   cUnitTest.TestResult("TestGetData", Test_GetData("TestGetData"));
   //--- etc...
}

//+------------------------------------------------------------------+
//| Test > Construct                                                 |
//+------------------------------------------------------------------+
void Test_Construct(const string testName)
{
   cUnitTest.TestStart(testName);
   
   cUnitTest.TestResult(testName,
      Test_Construct_Valid() &&
      Test_Construct_Invalid()
   );
}

//+------------------------------------------------------------------+
//| Test > Construct > Valid                                         |
//+------------------------------------------------------------------+
bool Test_Construct_Valid()
{
   cUnitTest.TestStep("Сheck the construct for validity");
   
   //------------------
   // Your check code
   //------------------
   
   return true; // or false
}

//+------------------------------------------------------------------+
//| Test > Construct > Invalid                                       |
//+------------------------------------------------------------------+
bool Test_Construct_Invalid()
{
   cUnitTest.TestStep("Check the construct for invalidity");
   
   //------------------
   // Your check code
   //------------------
   
   return false; // or true
}

//+------------------------------------------------------------------+
//| Test > GetData                                                   |
//+------------------------------------------------------------------+
bool Test_GetData(const string testName)
{
   cUnitTest.TestStart(testName);
   
   cUnitTest.TestStep("Check the 'GetData Arg1'");
   if (! Test_Construct_Arg1())
      return false;
   
   cUnitTest.TestStep("Check the 'GetData Arg2'");
   if (! Test_Construct_Arg2())
      return false;
   
   return true;
}

//+------------------------------------------------------------------+
//| Test > GetData > Arg1                                            |
//+------------------------------------------------------------------+
bool Test_Construct_Arg1()
{
   //------------------
   // Your check code
   //------------------
   
   return true; // or false
}

//+------------------------------------------------------------------+
//| Test > GetData > Arg2                                            |
//+------------------------------------------------------------------+
bool Test_Construct_Arg2()
{
   //------------------
   // Your check code
   //------------------
   
   return true; // or false
}

//+------------------------------------------------------------------+
