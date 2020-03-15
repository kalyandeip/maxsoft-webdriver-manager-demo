package com.maxsoft.webdrivermanager.driver.test;

import com.maxsoft.webdrivermanager.driver.DriverFactory;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.remote.BrowserType;

/**
 * Project Name    : maxsoft-webdriver-manager-demo
 * Developer       : Osanda Deshan
 * Version         : 1.0.0
 * Date            : 3/15/2020
 * Time            : 10:24 AM
 * Description     : This is an example of how to use maxsoft-webdrivermanager for chrome headless driver
 **/


public class ChromeHeadlessDriverTest extends TestBase {

    // Holds the WebDriver instance
    public static WebDriver driver;

    // Initialize a headless driver instance of chrome browser
    @Before
    public void initializeDriver() {
        driver = DriverFactory.getDriver(DriverFactory.HEADLESS_CHROME);
        driver.manage().window().maximize();
    }

    @Test
    public void testChromeHeadlessDriver() {
        testDriver(driver, BrowserType.CHROME);
    }

    // Close the chrome headless driver instance
    @After
    public void closeDriver() {
        driver.quit();
    }


}
