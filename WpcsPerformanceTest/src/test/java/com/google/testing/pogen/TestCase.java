package com.google.testing.pogen;

import static org.junit.Assert.*;

import java.io.File;
import java.util.ArrayList;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.experimental.theories.Theories;
import org.junit.runner.Description;
import org.junit.runner.Runner;
import org.junit.runner.notification.RunNotifier;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;

import com.google.testing.pogen.pages.IndexPage;

public class TestCase {
  @Test
  public void submit() throws InterruptedException {
    
    for (int user = 1; user <= 1; user++) {
      ArrayList<Thread> threads = new ArrayList<Thread>();
      for (int group = 1; group <= 20; group++) {
        final String account = "user_" + group + "_" + user;
        final String password = "password";

        Runnable runnable = new Runnable() {
          @Override
          public void run() {
            FirefoxDriver driver = new FirefoxDriver();
            driver.get("http://localhost:3333");

            driver.findElement(By.id("uid")).sendKeys(account);
            driver.findElement(By.id("password")).sendKeys(password);
            driver.findElement(By.name("commit")).submit();

            // Enter contest
            try {
              driver.findElement(By.linkText("attend")).click();
            } catch (Exception e) {
              driver.findElement(By.linkText("WUPC")).click();
            }
            String contestUrl = driver.getCurrentUrl();

            for (int problem = 1; problem <= 15; problem++) {
              // Open problem
              String title = "addition_" + problem;
              for (int i = 0; i < 3; i++) {
                Solve(driver, contestUrl, title, "small", 1000 + i);
              }
              Solve(driver, contestUrl, title, "small", 1 + problem);

              for (int i = 0; i < 3; i++) {
                Solve(driver, contestUrl, title, "large", 1000 + i);
              }
              Solve(driver, contestUrl, title, "large", 100 + problem);
            }

            driver.close();
          }
        };
        
        threads.add(new Thread(runnable));
      }
      for (Thread thread : threads) {
        thread.start();
      }
      for (Thread thread : threads) {
        thread.join();
      }
    }
  }

  private void Solve(FirefoxDriver driver, String contestUrl, String title, String type, int answer) {
    try {
      driver.findElement(By.linkText(title)).click();
      driver.findElement(By.id("solve_" + type)).click();
      driver.findElement(By.cssSelector("#form_" + type + " textarea")).sendKeys("" + answer);
      driver.findElement(By.cssSelector("#form_" + type + " input[name='commit']")).click();
    } catch (Exception e) {
      driver.get(contestUrl);
    }
  }
}
