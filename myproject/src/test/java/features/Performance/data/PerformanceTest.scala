package Performance

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import scala.concurrent.duration._

class PerformanceTest extends Simulation {

  val protocol = karateProtocol()
  protocol.nameResolver = (req, ctx) => req.getHeader("karate-name")
  protocol.runner.karateEnv("perf")

  val create = scenario("create").exec(karateFeature("classpath:features/Performance/CreateUser.feature"))
 
  setUp(
    
    create.inject(
   
        atOnceUsers(1), // Lanzar un solo usuario 
        nothingFor(4 seconds), // No hacer nada durante 4 segundos
        rampUsers(15).during(5 seconds), // Inyecta 10 en usuarios en un marco de tiempo de 5 sec
        constantUsersPerSec(1).during(15 seconds), // Inyecta 10 usuarios durante 60 segundos
        constantUsersPerSec(3).during(3 seconds).randomized,// Inyecta 20 usuarios durante 3 aleatoriamente
        rampUsersPerSec(10).to(20).during(1.seconds), // inyecta 10 usuarios hasta 20 durante un minuto
        rampUsersPerSec(3).to(5).during(1 seconds).randomized // inyecta de 10 a 11 usuarios durante 60 segundos
      ).protocols(protocol)


  )

}