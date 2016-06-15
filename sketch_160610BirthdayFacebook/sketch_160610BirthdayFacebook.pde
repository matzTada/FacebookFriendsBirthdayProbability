import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

void setup() {
  println("========== Equation Evaluation Start ==========");

  String headerStr = "N,P";
  headerStr += "\r\n";

  try {
    File file = new File(dataPath("equationEvaluationResult.csv"));
    FileWriter filewriter = new FileWriter(file);
    filewriter.write(year() + "/" + month() + "/" + day() + "_" +hour() + ":" +minute() + ":" +second() + ","
      + "\r\n"
      + headerStr
      );
    filewriter.close();
    println("========== CAN write to file OK!!==========");
  }
  catch(IOException e) {
    println("========= CANNOT write to file MEN!!==========");
  }

  for (int N = 365; N <= 1000; N++) {
    long startMillis = millis();

    String saveStr = "" + N + ",";
    double P = 1.0d;

    for (double i = 1; i <= 364; i += 1) {     
      P *= i /(N + i);
    }
    for (double i = 365; i <= N - 1; i += 1) {     
      P *= i /(N - i);
    }

    saveStr += P;   
    saveStr += "\r\n";

    try {
      File file = new File(dataPath("equationEvaluationResult.csv"));
      FileWriter filewriter = new FileWriter(file, true);
      filewriter.write(saveStr);
      filewriter.close();
    }
    catch(IOException e) {
    }

    println("N," + N + ",timePassed:," + (millis() - startMillis) + "ms");
  }

  println("========== Equation Evaluation Finish ==========");
}

void draw() {
}

