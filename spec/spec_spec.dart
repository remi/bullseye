class SpecSpec extends SpecDartTest {
  spec() {

    var noDescribes               = new SpecSpec_NoDescribes();
    var manyDescribes             = new SpecSpec_ManyDescribes();
    var manyDescribesWithExamples = new SpecSpec_ManyDescribesWithExamples();

    describe("Spec", {

      "can have no describes": (){
        Expect.equals(0, noDescribes.describes.length);
      },

      "can have many describes": (){
        Expect.equals(2, manyDescribes.describes.length);
        Expect.equals("Foo", manyDescribes.describes[0].subject);
        Expect.equals("Bar", manyDescribes.describes[1].subject);
      }

    });
  }
}

class SpecSpec_NoDescribes extends Spec {}
class SpecSpec_ManyDescribes extends Spec {
  spec() {
    describe("Foo");
    describe("Bar");
  }
}
class SpecSpec_ManyDescribesWithExamples extends Spec {}
