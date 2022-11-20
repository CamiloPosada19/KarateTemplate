package features.AdvancesExamples;
import com.intuit.karate.junit5.Karate;
public class AdvanceRunner {

    @Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
    }  
    
}
