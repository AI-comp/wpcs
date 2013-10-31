package com.google.testing.pogen.pages;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintStream;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;

aspect Selenium {
  pointcut usingLocator(WebDriver selenium, By locator): call(* WebDriver.*(..)) && target(selenium) && args(locator, ..) && !this(Selenium);

  private static PrintStream out;

  static {
    try {
      out = new PrintStream(new File("element.log"));
    } catch (FileNotFoundException e) {
      e.printStackTrace();
    }
  }

  before(WebDriver selenium, By locator): usingLocator(selenium, locator) {
    print(selenium, locator, thisJoinPoint.getSignature().getName());
  }

  private void print(WebDriver selenium, By locator, String methodName) {
    try {
      out.println("[" + methodName + "] " + selenium.findElement(locator).getAttribute("lang"));
      System.out.println("[" + methodName + "] " + selenium.findElement(locator).getAttribute("lang"));
    } catch (Exception e) {}
  }
}
