package kr.co.withmall.logback;

import java.text.SimpleDateFormat;

import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.core.LayoutBase;

public class WithmallLogbackLayout extends LayoutBase<ILoggingEvent> {

  @Override
  public String doLayout(ILoggingEvent event) {
    
    StringBuilder sb = new StringBuilder();
    
    sb.append("[");
    sb.append(new SimpleDateFormat("HH:mm:ss").format(event.getTimeStamp()));
    sb.append("]");
    
    String loggerName = event.getLoggerName();

    if(!loggerName.endsWith("RequestCheckAop")) {      
      sb.append(String.format("%-5s", event.getLevel()));
      sb.append(":");
      sb.append(loggerName);
    }
    
    if(loggerName.equals("jdbc.sqlonly")) {
      sb.append("\n    ");
    } else {
      sb.append(" - ");
    }
    
    sb.append(event.getFormattedMessage());
    sb.append("\n");
    
    return sb.toString();
    
    /*
    StringBuilder sb = new StringBuilder();
    
    sb.append("[");
    sb.append(new SimpleDateFormat("HH:mm:ss").format(event.getTimeStamp()));
    sb.append("] ");
    sb.append(String.format("%-5s", event.getLevel()));
    sb.append(":");
    String loggerName = event.getLoggerName();
    sb.append(loggerName);
    if(loggerName.equals("jdbc.sqlonly")) {
      sb.append("\n    ");
    } else {
      sb.append(" - ");
    }
    sb.append(event.getFormattedMessage());
    sb.append("\n");
    
    return sb.toString();
    */
    
    
  }
  
}
