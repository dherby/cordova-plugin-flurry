// Flurry Phonegap Plugin by JFP 12/2012

(function(window) {
    var cordova = window.cordova || window.Cordova || window.PhoneGap;
    
    // helper function to prevent Objective C bleed over into javascript
    function bool2ObjC(value) {
        
        if(value === true) {
            return 'YES';
            } else if(value === false) {
            return 'NO'
        }
        
        return value.toUpperCase();
    }
    
    function Flurry() {};
    
    /*
    ** These functions must be called before you start the Flurry session
    */
    
    // Sets the version name of the app. 
    // This name will appear in the http://dev.flurry.com as a filtering option by version. 
    // This should be called before init
    Flurry.prototype.setVersionName = function(version,successCallback,failureCallback) {
        return cordova.exec(successCallback, failureCallback, 'FlurryPlugin', 'setVersionName', [version]);
    };
    
    // Use setLogEvents to enable/disable the event logging. This should be called before init
    Flurry.prototype.setLogEvents = function(enableValue, successCallback, failureCallback) {
        return cordova.exec( successCallback, failureCallback, 'FlurryPlugin', 'setLogEvents', [bool2ObjC(enableValue)]);
    };  
    
    // Use setLogEnabled to enable/disable internal Flurry SDK logging. This should be called before init .
    Flurry.prototype.setLogEnabled = function(enableValue, successCallback, failureCallback) {
        return cordova.exec( successCallback, failureCallback, 'FlurryPlugin', 'setLogEnabled', [bool2ObjC(enableValue)]);
    }; 
    
    // Sets the log level of the internal Flurry SDK logging. Valid inputs are Log.VERBOSE, Log.WARN etc.
    // Default log level is Log.WARN. This should be called before init
    Flurry.prototype.setLogLevel = function(logLevel, successCallback, failureCallback) {
        return cordova.exec( successCallback, failureCallback, 'FlurryPlugin', 'setLogLevel', [logLevel]);
    };
    
    // Use setReportLocation to enable/disable location tracking. Flurry uses cached value 
    // (to avoid excessive battery usage) when location reporting is enabled .
    // You may call FlurryAgent.setLocation() to set the location manually if your app uses the GPS.
    Flurry.prototype.setReportLocation = function(enableValue, successCallback, failureCallback) {
        return cordova.exec( successCallback, failureCallback, 'FlurryPlugin', 'setReportLocation', [bool2ObjC(enableValue)]);
    };  
    
    //Enabling Flurry Pulse shares your app data with Pulse integrated partners. Starting version 5.5.0, Flurry
    // provides means to turn on sending selected session events to integrated partners. You need to turn on
    // Pulse using the API call before calling FlurryAgent.init() . Use setPulseEnabled to enable/disable
    // Flurry Pulse.
    Flurry.prototype.setPulseEnabled = function(enableValue, successCallback, failureCallback) {
        return cordova.exec( successCallback, failureCallback, 'FlurryPlugin', 'setPulseEnabled', [bool2ObjC(enableValue)]);
    };  
    
    // If you wish to change the window during which a session can be resumed, call
    // FlurryAgent.setContinueSessionMillis(long milliseconds) before the call to init
    Flurry.prototype.setContinueSessionMillis = function(milliseconds, successCallback, failureCallback) {
        return cordova.exec( successCallback, failureCallback, 'FlurryPlugin', 'setContinueSessionMillis', [milliseconds]);
    };
    
    // Used to allow/disallow Flurry SDK to report uncaught exceptions. 
    // The feature is enabled by default and if you would like to disable this behavior, this must be called before calling init
    Flurry.prototype.setCrashReportingEnabled = function(enableValue, successCallback, failureCallback) {
        return cordova.exec( successCallback, failureCallback, 'FlurryPlugin', 'setCrashReportingEnabled', [bool2ObjC(enableValue)]);
    };
    
    // Use addOrigin to add the origin attribution. The event is identified by the originName, originVersion and
    // originParameters. OriginParameters can be passed in as a Map<String,String> where the key is the
    // parameter name, and the value is the value. This should be called before init
    // String originName, String originVersion, parameters must be a JSON dictionary that contains only strings like {id:"4", price: "471"}
    Flurry.prototype.addOrigin = function(originName, originVersion, successCallback, failureCallback) {
        return cordova.exec( successCallback, failureCallback, 'FlurryPlugin', '"addOrigin"', [originName, originVersion]);
    };  
    Flurry.prototype.addOriginWithParameters = function(originName, originVersion, parameters, successCallback, failureCallback) {
        return cordova.exec( successCallback, failureCallback, 'FlurryPlugin', '"addOriginWithParameters"', [originName, originVersion, parameters]);
    };  
    
    // Use this to log the user's gender. Valid inputs are Constants.MALE or Constants.FEMALE . 
    // This should be called before init , if possible.gender must be a string.
    // male and female are acceptable values
    Flurry.prototype.setGender = function(gender, successCallback, failureCallback) {
        return cordova.exec( successCallback, failureCallback, 'FlurryPlugin', 'setGender', [gender]);
    };
    
    // Use this to log the user's assigned ID or username in your system. This should be called before init , 
    // if possible. userID must be a string. 
    Flurry.prototype.setUserID = function(userID, successCallback, failureCallback) {
        return cordova.exec( successCallback, failureCallback, 'FlurryPlugin', 'setUserID', [userID]);
    };
    
    // Use this to log the user's age. Valid inputs are between 1 and 109. 
    // This should be called before init , if possible. age must be an integer
    Flurry.prototype.setAge = function(age, successCallback, failureCallback) {
        return cordova.exec( successCallback, failureCallback, 'FlurryPlugin', 'setAge', [age]);
    };
    
    /*
    ** End of functions that must be called before Flurry session starts
    */
    
    // key is a string
    Flurry.prototype.startSession = function(key,successCallback,failureCallback) {
        return cordova.exec(successCallback, failureCallback, 'FlurryPlugin', 'startSession', [key]);
    };
    
    Flurry.prototype.endSession = function(successCallback,failureCallback) {
        return cordova.exec(successCallback, failureCallback, 'FlurryPlugin', 'endSession', []);
    };
    
    // event must be a string
    Flurry.prototype.logEvent = function(event, successCallback, failureCallback) {
        return cordova.exec( successCallback, failureCallback, 'FlurryPlugin', 'logEvent', [event]);
    };
    
    // parameters must be a JSON dictionary that contains only strings like {id:"4", price: "471", location: "New York"}
    Flurry.prototype.logEventWithParameters = function(event, parameters, successCallback, failureCallback) {
        return cordova.exec( successCallback, failureCallback, 'FlurryPlugin', 'logEventWithParameters', [event, parameters]);
    };
    
    // timed must be Yes or No, because it's objective C
    Flurry.prototype.logTimedEvent = function(event, timed, successCallback, failureCallback) {
        return cordova.exec( successCallback, failureCallback, 'FlurryPlugin', 'logTimedEvent', [event, bool2ObjC(timed)]);
    };
    
    // parameters must be a JSON dictionary that contains only strings like {id:"4", price: "471"}
    // timed must be Yes or No, because it's objective C
    Flurry.prototype.logTimedEventWithParameters = function(event, parameters, timed, successCallback, failureCallback) {
        return cordova.exec( successCallback, failureCallback, 'FlurryPlugin', 'logTimedEventWithParameters', [event, parameters, bool2ObjC(timed)]);
    };
    
    
    // Timed event can be logged using FlurryAgent.logEvent . Use endTimedEvent to end the timed event.
    Flurry.prototype.endTimedEvent = function(event, successCallback, failureCallback) {
        return cordova.exec( successCallback, failureCallback, 'FlurryPlugin', 'endTimedEvent', [event]);
    };
    
    // parameters must be a JSON dictionary that contains only strings like {id:"4", price: "471"}
    // only used if you want to override the original parameters
    Flurry.prototype.endTimedEventWithParameters = function(event, parameters, successCallback, failureCallback) {
        return cordova.exec( successCallback, failureCallback, 'FlurryPlugin', 'endTimedEventWithParameters', [event, parameters]);
    };
    
    // Use onPageView to report page view count. You should call this method whenever a new page is shown 
    // to the user to increment the total count. Page view is tracked separately from events.
    Flurry.prototype.onPageView = function(successCallback, failureCallback) {
        return cordova.exec( successCallback, failureCallback, 'FlurryPlugin', 'onPageView', []);
    };
    
    // Call this method to set the current location (used with geographical targeting). 
    // This should be called beforeinit , if possible; otherwise call it as soon as the location is available.
    // [IOS] (float) horizontalAccuracy : The radius of uncertainty for the location in meters.
    // [IOS] (float) verticalAccuracy : The accuracy of the altitude value in meters
    Flurry.prototype.setLocation = function(lat, lng,  hr, vt, hsuccessCallback, failureCallback) {
        return cordova.exec(successCallback, failureCallback, 'FlurryPlugin', 'setLocation', [lat, lng, hr, vt]);
    };  
    
    // Use onError to report errors that your application catches. 
    // Flurry will report the first 10 errors to occur in each session.
    Flurry.prototype.onError = function(errorID, message, successCallback, failureCallback) {
        return cordova.exec( successCallback, failureCallback, 'FlurryPlugin', 'onError', [errorID, message]);
    };
    
    // Gets the active Flurry session id.
    Flurry.prototype.getSessionId = function(successCallback, failureCallback) {
        return cordova.exec( successCallback, failureCallback, 'FlurryPlugin', 'getSessionId', []);
    };
    
    // Returns a string containing current Flurry SDK release version
    Flurry.prototype.getReleaseVersion = function(successCallback, failureCallback) {
        return cordova.exec( successCallback, failureCallback, 'FlurryPlugin', 'getReleaseVersion', []);
    };
    
    // Gets the version of the Flurry SDK.
    Flurry.prototype.getAgentVersion = function(successCallback, failureCallback) {
        return cordova.exec( successCallback, failureCallback, 'FlurryPlugin', 'getAgentVersion', []);
    };
    
    // Returns true if Flurry session is active and false otherwise.
    Flurry.prototype.isSessionActive = function(successCallback, failureCallback) {
        return cordova.exec( successCallback, failureCallback, 'FlurryPlugin', 'isSessionActive', []);
    };
    
    /* [IOS] Specifics */
    
    // [IOS] argument must be Yes or No, because it's objective C
    Flurry.prototype.setSessionReportsOnCloseEnabled = function (enabled, successCallback, failureCallback) {
        return cordova.exec(successCallback, failureCallback, 'FlurryPlugin', 'setSessionReportsOnCloseEnabled', [bool2ObjC(enabled)]);
    };
    
    // [IOS] argument must be Yes or No, because it's objective C
    Flurry.prototype.setSessionReportsOnPauseEnabled = function (enabled, successCallback, failureCallback) {
        return cordova.exec(successCallback, failureCallback, 'FlurryPlugin', 'setSessionReportsOnPauseEnabled', [bool2ObjC(enabled)]);
    };
    
    /* Main Call */
    Flurry.install = function() {
        if (!window.plugins) {
            window.plugins = {};
        }
        window.plugins.flurry = new Flurry();
    };
    
    cordova.addConstructor(Flurry.install);
    
})(typeof global === "object" ? global : window);
