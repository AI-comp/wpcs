package com.google.testing.pogen.pages;

import static org.junit.Assert.*;
import static org.hamcrest.Matchers.*;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.How;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class IndexPage extends AbstractPage {
  public IndexPage(WebDriver driver) {
    super(driver);
    assertInvariant();
  }

  private void assertInvariant() {
  }

  /* ------------------- GENERATED CODE START ------------------- */
  private static Pattern commentPattern = Pattern.compile("<!--POGEN,([^,]*),([^,]*),(.*?)-->");
  @FindBy(how = How.XPATH, using = "//*[@lang='__pogen_0']")
  private WebElement title;
  @FindBy(how = How.XPATH, using = "//*[@lang='__pogen_1']")
  private WebElement value;
  @FindBy(how = How.XPATH, using = "//*[@lang='__pogen_2']")
  private WebElement value2;
  @FindBy(how = How.XPATH, using = "//*[@lang='test3']")
  private WebElement value3;

  public WebElement getElementForTitle() {
    return title;
  }

  public String getTextForTitle() {
    Matcher matcher = commentPattern.matcher(driver.getPageSource());
    while (matcher.find()) {
      if (matcher.group(1).equals("__pogen_0") && matcher.group(2).equals("title")) {
        return matcher.group(3);
      }
    }
    return null;
  }

  public WebElement getElementForValue() {
    return value;
  }

  public String getTextForValue() {
    Matcher matcher = commentPattern.matcher(driver.getPageSource());
    while (matcher.find()) {
      if (matcher.group(1).equals("__pogen_1") && matcher.group(2).equals("value")) {
        return matcher.group(3);
      }
    }
    return null;
  }

  public WebElement getElementForValue2() {
    return value2;
  }

  public String getTextForValue2() {
    Matcher matcher = commentPattern.matcher(driver.getPageSource());
    while (matcher.find()) {
      if (matcher.group(1).equals("__pogen_2") && matcher.group(2).equals("value2")) {
        return matcher.group(3);
      }
    }
    return null;
  }

  public WebElement getElementForValue3() {
    return value3;
  }

  public String getTextForValue3() {
    Matcher matcher = commentPattern.matcher(driver.getPageSource());
    while (matcher.find()) {
      if (matcher.group(1).equals("test3") && matcher.group(2).equals("value3")) {
        return matcher.group(3);
      }
    }
    return null;
  }

  public List<WebElement> getElementsForValue4() {
    List<WebElement> result = new ArrayList<WebElement>();
    for (WebElement e : driver.findElements(By.xpath("//*[@lang='__pogen_3']"))) {
      result.add(e);
    }
    return result;
  }

  public List<String> getTextsForValue4() {
    List<String> result = new ArrayList<String>();
    Matcher matcher = commentPattern.matcher(driver.getPageSource());
    while (matcher.find()) {
      if (matcher.group(1).equals("__pogen_3") && matcher.group(2).equals("value4")) {
        result.add(matcher.group(3));
      }
    }
    return result;
  }
  /* -------------------- GENERATED CODE END -------------------- */
}
