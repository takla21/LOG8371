package weka;

import junit.framework.Test;
import junit.framework.TestSuite;

public class AllTestsNeeded extends TestSuite{
	public static Test suite() {
	    TestSuite suite = new TestSuite();

	    suite.addTest(weka.associations.FPGrowthTest.suite());
	    
	    suite.addTest(weka.clusterers.FarthestFirstTest.suite());
	    
	    suite.addTest(weka.clusterers.SimpleKMeansTest.suite());
	    
	    suite.addTest(weka.classifiers.bayes.NaiveBayesTest.suite());
	    
	    suite.addTest(weka.classifiers.trees.DecisionStumpTest.suite());
		
		suite.addTest(weak.associations.FPGrowthCustomTest.suite());

	    return suite;
	  }

	  public static void main(String[] args) {
	    junit.textui.TestRunner.run(suite());
	  }
}
