package com.google.testing.pogen;

import static org.junit.Assert.*;

import java.io.File;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;

import com.google.testing.pogen.pages.IndexPage;

public class TestCase {
  private FirefoxDriver driver;

  @Test
  public void submit() {

    for (int group = 1; group <= 20; group++) {
      for (int user = 1; user <= 5; user++) {
        driver = new FirefoxDriver();
        driver.get("http://localhost:3000");
        
        String account = "user_" + group + "_" + user;
        String password = "password";

        driver.findElement(By.id("uid")).sendKeys(account);
        driver.findElement(By.id("password")).sendKeys(password);
        driver.findElement(By.id("login")).submit();

        // Enter contest
        driver.findElement(By.linkText("attend")).click();

        for (int problem = 1; problem <= 15; problem++) {
          // Open problem
          String title = "addition_" + problem;
          for (int i = 0; i < 10; i++) {
            driver.findElement(By.linkText(title)).click();
            driver.findElement(By.id("solve_small")).click();
            driver.findElement(By.cssSelector("#form_small textarea")).sendKeys("10000");
          }
          driver.findElement(By.linkText(title)).click();
          driver.findElement(By.id("solve_small")).click();
          driver.findElement(By.cssSelector("#form_small textarea")).sendKeys("" + (10 + problem));
          
          for (int i = 0; i < 10; i++) {
            driver.findElement(By.linkText(title)).click();
            driver.findElement(By.id("solve_large")).click();
            driver.findElement(By.cssSelector("#solve_large textarea")).sendKeys("10000");
          }
          driver.findElement(By.linkText(title)).click();
          driver.findElement(By.id("solve_large")).click();
          driver.findElement(By.cssSelector("#solve_large textarea")).sendKeys("" + (100 + problem));
        }
        
        driver.close();
      }
    }
  }
}
