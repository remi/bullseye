class OriginalTestFixtureSpec extends SpecMap_Bullseye {
  spec() {

    var noTests   = new DescribeSpec_NoTests();
    var manyTests = new DescribeSpec_ManyTests();

    describe("TestFixture", {

      "can have no tests": (){
        var testFixture = new DescribeSpec_NoTests().testFixtures[0];

        Expect.equals(0, testFixture.tests.length);
      },

      "can have many tests": (){
        var spec      = new DescribeSpec_ManyTests();
        var testFixture1 = spec.testFixtures[0];
        var testFixture2 = spec.testFixtures[1];

        Expect.equals(2, testFixture1.tests.length);
        Expect.equals("should do stuff", testFixture1.tests[0].description);
        Expect.equals("should do other stuff", testFixture1.tests[1].description);

        Expect.equals(1, testFixture2.tests.length);
        Expect.equals("should do more stuff", testFixture2.tests[0].description);
      },

      "can have many sub-testFixtures": (){
        var spec = new DescribeSpec_SubDescribes();

        // the spec only has it's 2 testFixtures, the other testFixtures 
        // are stored inside each of these testFixtures.
        Expect.equals(2, spec.testFixtures.length);

        Expect.equals("outer top it", spec.testFixtures[0].tests[0].description);
        Expect.equals("inner first", spec.testFixtures[0].testFixtures[0].description);
        Expect.equals("inner first it", spec.testFixtures[0].testFixtures[0].tests[0].description);
        Expect.equals("outer bottom it", spec.testFixtures[0].tests[1].description);

        Expect.equals("inner second", spec.testFixtures[1].testFixtures[0].description);
        Expect.equals("inner inner second", spec.testFixtures[1].testFixtures[0].testFixtures[0].description);
        Expect.equals("inner inner second it", spec.testFixtures[1].testFixtures[0].testFixtures[0].tests[0].description);
      }

    });
  }
}

class DescribeSpec_NoTests extends BullseyeSpec {
  spec(){ describe("desc", (){}); }
}
class DescribeSpec_ManyTests extends BullseyeSpec {
  spec() {
    describe("desc", (){
      it("should do stuff");
      it("should do other stuff");
    });
    describe("more", (){
      it("should do more stuff");
    });
  }
}
class DescribeSpec_SubDescribes extends BullseyeSpec {
  spec() {
    describe("outer first", (){
      it("outer top it");
      describe("inner first", (){
        it("inner first it");
      }); 
      it("outer bottom it");
    });
    describe("outer second", (){
      describe("inner second", (){
        describe("inner inner second", (){
          it("inner inner second it");
        });
      });
    });
  }
}
