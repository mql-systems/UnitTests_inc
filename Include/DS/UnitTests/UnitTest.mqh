//+------------------------------------------------------------------+
//|                                                     UnitTest.mqh |
//|                            Copyright 2021, Diamond Systems Corp. |
//|                                       https://diamondsystems.org |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, Diamond Systems Corp."
#property link      "https://diamondsystems.org"
#property version   "1.00"

class UnitTest
{
   public:
      int               m_TestsPerformed;
      int               m_TestsPassed;
   
   public:
      void              UnitTest();
      void             ~UnitTest();
      //---
      void              OnStart(const string packageName);
      virtual void      TestMain() =NULL;
      //---
      void              TestStart(const string testName);
      void              TestStep(const string stepDesc);
      bool              TestResult(const string testName, const bool result);
      virtual bool      TestMisc(const string testName = "TestMisc functions test") { return true; }
};

//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
void UnitTest::UnitTest(): m_TestsPerformed(0),
                           m_TestsPassed(0)
{}

//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
void UnitTest::~UnitTest()
{}

//+------------------------------------------------------------------+
//| OnStart                                                          |
//+------------------------------------------------------------------+
void UnitTest::OnStart(const string packageName)
{
   MathSrand(0);
   Print("========== START Unit tests ==========\n");
   PrintFormat("Unit tests for Package %s\n", packageName);
   
   TestMain();
   
   PrintFormat("\n%d of %d passed\n", m_TestsPerformed, m_TestsPassed);
   Print("========== END Unit tests ==========");
}

//+------------------------------------------------------------------+
//| Test start                                                       |
//+------------------------------------------------------------------+
void UnitTest::TestStart(const string testName)
{
   m_TestsPerformed++;
   PrintFormat("%s started", testName);
}

//+------------------------------------------------------------------+
//| Test step                                                        |
//+------------------------------------------------------------------+
void UnitTest::TestStep(const string stepDesc)
{
   PrintFormat("- %s", stepDesc);
}

//+------------------------------------------------------------------+
//| Test result                                                      |
//+------------------------------------------------------------------+
bool UnitTest::TestResult(const string testName, const bool result)
{
   if (result)
   {
      m_TestsPassed++;
      PrintFormat("%s passed\n",testName);
   }
   else
      PrintFormat("%s failed\n",testName);
   
   return result;
}

//+------------------------------------------------------------------+