using Toybox.Graphics as Gfx;
using Toybox.System as Sys;

//! inherit from the view that contains the commonlogic
class DeviceView extends PowerView {
	var myTime;
	var strTime;

	//! it's good practice to always have an initialize, make sure to call your parent class here!
    function initialize() {
        PowerView.initialize();
    }

	function onUpdate(dc) {
		//! call the parent function in order to execute the logic of the parent
		PowerView.onUpdate(dc);
                
		//! Conditions for showing the demoscreen       
        if (uShowDemo == false) {
        	if (licenseOK == false && jTimertime > 900)  {
        		uShowDemo = true;        		
        	}
        }

	   //! Check whether demoscreen is showed or the metrics 
	   if (uShowDemo == false ) {

		var info = Activity.getActivityInfo();
		
		//! Draw separator lines
        dc.setColor(mColourLine, Graphics.COLOR_TRANSPARENT);
        dc.setPenWidth(2);

        //! Horizontal dividers
        dc.drawLine(40,  28,  200, 28);
        dc.drawLine(3,   76,  237, 76);
        dc.drawLine(0,   124, 240, 124);
        dc.drawLine(3,   172,  237, 172);
        dc.drawLine(53, 220, 187, 220);

        //! Vertical dividers
        dc.drawLine(119, 29,  119, 77);
        if (uUpperMiddleRowBig == false) {
        	dc.drawLine(73,  77,  73,  125);
        	dc.drawLine(164,  77,  164,  125);
        } else {
        	dc.drawLine(119,  77,  119,  125);
        }
        if (uLowerMiddleRowBig == false) {
        	dc.drawLine(73,  125,  73,  173);
        	dc.drawLine(164, 125,  164, 173);
        } else {
        	dc.drawLine(119, 125,  119, 173);
        }
        dc.drawLine(119, 173, 119, 219);

        //! Display GPS accuracy
        dc.setColor(mGPScolor, Graphics.COLOR_TRANSPARENT);
        dc.fillRectangle(10, 5, 64, 22); 
		if (uMilClockAltern == 1) {
		   dc.fillRectangle(183, 5, 55, 22);
	    } else {
	       dc.fillRectangle(165, 5, 55, 22);
	    }
        
        dc.setColor(mColourFont, Graphics.COLOR_TRANSPARENT);
        //! Show number of laps, metric or clock with current time in top
		myTime = Toybox.System.getClockTime(); 
    	strTime = myTime.hour.format("%02d") + ":" + myTime.min.format("%02d");
		if (uMilClockAltern == 0) {		
			dc.drawText(120, -4, Graphics.FONT_MEDIUM, strTime, Graphics.TEXT_JUSTIFY_CENTER);
		}

		//! Display metrics
		for (var i = 1; i < 11; ++i) {
	    	if ( i == 1 ) {			//!upper row, left
	    		if ( fieldFormat[i].equals("time") == true and fieldValue[i] > 36000) { 
	    			Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"074,058,084,020,062,073,035");
	    		} else {
	    			Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"074,058,075,026,062,073,035");
	    		}
	       	} else if ( i == 2 ) {	//!upper row, right
	    		if ( fieldFormat[i].equals("time") == true and fieldValue[i] > 36000) { 
	    			Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"165,058,184,120,062,167,035");
	    		} else {
	    			Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"165,058,177,127,062,167,035");
	    		}
	       	} else if ( i == 3 ) {  //!middle row, left
	       		if (uUpperMiddleRowBig == false) {
	    			Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"036,106,000,000,000,036,083");
	    		} else {
	    			Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"074,098,000,000,000,015,083");
	    		}
	       	} else if ( i == 4 ) {	//!middle row, middle
	    		if (uUpperMiddleRowBig == false) {
	    			Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"118,106,000,000,000,118,083");
	    		}
	       	} else if ( i == 5 ) {  //!middle row, right
	    		if (uUpperMiddleRowBig == false) {
	    			Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"202,106,000,000,000,201,083");
	    		} else {
	    			Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"165,098,000,000,000,225,083");
	    		}
	       	} else if ( i == 6 ) {	//!lower row, left
	    		if (uLowerMiddleRowBig == false) {
	    			Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"036,154,000,000,000,036,131");
	    		} else {
	    			Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"074,146,000,000,000,015,131");
	    		}
	       	} else if ( i == 7 ) {	//!lower row, right
	    		if (uLowerMiddleRowBig == false) {
	    			Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"118,154,000,000,000,118,131");
	    		}
	       	} else if ( i == 8 ) {  //!middle row, right
	       		if (uLowerMiddleRowBig == false) {
	    			Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"202,154,000,000,000,201,131");
	    		} else {
	    			Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"165,146,000,000,000,225,131");
	    		}
	       	} else if ( i == 9 ) {	//!lower row, left
	    		if ( fieldFormat[i].equals("time") == true and fieldValue[i] > 36000) { 
	    			if (uLabelfontbig == true) {
	    			    Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"074,187,088,025,190,080,212");
	    			} else {
	    			    Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"074,187,088,025,190,080,211");
	    			}
	    		} else {
	    			if (uLabelfontbig == true) {
	    			    Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"074,187,082,033,190,080,212");
	    			} else {
	    			    Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"074,187,082,033,190,080,211");
	    			}
	    		}
	       	} else if ( i == 10 ) {	//!lower row, right
	    		if ( fieldFormat[i].equals("time") == true and fieldValue[i] > 36000) { 
	    		    if (uLabelfontbig == true) {
	    		        Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"165,187,180,117,190,157,212");
	    		    } else {
	    			    Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"165,187,180,117,190,157,211");
	    			}
	    		} else {
	    			if (uLabelfontbig == true) {
	    			    Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"165,187,172,123,190,157,212");
	    			} else {
	    			    Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"165,187,172,123,190,157,211");
	    			}
	    		}
       		}       	
		}
		
		if (jTimertime == 0) {
	    	if (uShowRedClock == true) {
		    	dc.setColor(Graphics.COLOR_RED, Graphics.COLOR_TRANSPARENT);
				dc.drawText(120, 190, Graphics.FONT_MEDIUM, strTime, Graphics.TEXT_JUSTIFY_CENTER);
		    }
		}
		
		//! Bottom battery indicator
	 	var stats = Sys.getSystemStats();
		var pwr = stats.battery;	
		var mBattcolor = (pwr > 15) ? mColourFont : Graphics.COLOR_RED;
		dc.setColor(mBattcolor, Graphics.COLOR_TRANSPARENT);
		dc.fillRectangle(92, 222, 54, 15);
		dc.fillRectangle(146, 225, 3, 8);
		
		dc.setColor(mColourBackGround, Graphics.COLOR_TRANSPARENT);
		var Startstatuspwrbr = 94 + pwr*0.5  ;
		var Endstatuspwrbr = 50 - pwr*0.5 ;
		dc.fillRectangle(Startstatuspwrbr, 224, Endstatuspwrbr, 11);	
		
		if ( pwr > 50 ) {
			dc.drawText(105+15*(pwr-50)/50, 229, Labelfont2, pwr.format("%0d") + "%", Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
		} else{
			dc.setColor(mColourFont, Graphics.COLOR_TRANSPARENT);
			dc.drawText(132-12*(50-pwr)/50, 229, Labelfont2, pwr.format("%0d") + "%", Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
		}
		

	   } else {
	   //! Display demo screen
		dc.setColor(mColourFont, Graphics.COLOR_TRANSPARENT);
	
		if (licenseOK == true) {
      		dc.drawText(120, 120, Graphics.FONT_TINY, "Registered !!", Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
			dc.drawText(81, 160, Graphics.FONT_XTINY, "License code: ", Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
			dc.drawText(180, 160, Graphics.FONT_XTINY, mtest, Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
			if (c0Version == true) {
				dc.drawText(81, 190, Graphics.FONT_XTINY, "C-Code: ", Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
				dc.drawText(160, 190, Graphics.FONT_XTINY, CCode, Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
			}
		} else {
      		dc.drawText(120, 33, Graphics.FONT_XTINY, "License needed !!", Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
      		dc.drawText(120, 63, Graphics.FONT_XTINY, "Run is recorded though", Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
			dc.drawText(60, 105, Graphics.FONT_MEDIUM, "ID 0: ", Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
			dc.drawText(161, 98, Graphics.FONT_NUMBER_MEDIUM, ID0+12781 , Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
			dc.drawText(60, 145, Graphics.FONT_MEDIUM, "ID 1: " , Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
			dc.drawText(161, 138, Graphics.FONT_NUMBER_MEDIUM, ID1, Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
			dc.drawText(60, 185, Graphics.FONT_MEDIUM, "ID 2: " , Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
			dc.drawText(161, 178, Graphics.FONT_NUMBER_MEDIUM, ID2, Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
      	}
	   }
	   
	}

}