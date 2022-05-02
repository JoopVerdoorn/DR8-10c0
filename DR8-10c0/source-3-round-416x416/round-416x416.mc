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
        dc.drawLine(70,  48,  346, 48);
        dc.drawLine(6,   131,  412, 131);
        dc.drawLine(0,   214, 416, 214);
        dc.drawLine(4,   297,  412, 297);
        dc.drawLine(92, 382, 324, 382);

        //! Vertical dividers
        dc.drawLine(207, 48,  207, 134);
        if (uUpperMiddleRowBig == false) {
        	dc.drawLine(126,  131,  126,  214);
        	dc.drawLine(284,  131,  284,  214);
        } else {
        	dc.drawLine(207,  131,  207,  214);
        }
        if (uLowerMiddleRowBig == false) {
        	dc.drawLine(126,  214,  126,  297);
        	dc.drawLine(284, 214,  284, 297);
        } else {
        	dc.drawLine(207, 214,  207, 297);
        }
        dc.drawLine(207, 297, 207, 382);

		//! Display GPS accuracy
        dc.setColor(mGPScolor, Graphics.COLOR_TRANSPARENT);
        dc.fillRectangle(18, 9, 114, 39); 
		if (uMilClockAltern == 1) {
		   dc.fillRectangle(313, 9, 95, 39);
		} else {
		   dc.fillRectangle(284, 9, 95, 39);
		}
        
        dc.setColor(mColourFont, Graphics.COLOR_TRANSPARENT);
        //! Show number of laps, metric or clock with current time in top
		myTime = Toybox.System.getClockTime(); 
    	strTime = myTime.hour.format("%02d") + ":" + myTime.min.format("%02d");
		if (uMilClockAltern == 0) {		
			dc.drawText(208, -2, Graphics.FONT_MEDIUM, strTime, Graphics.TEXT_JUSTIFY_CENTER);
		}

		//! Display metrics
		for (var i = 1; i < 11; ++i) {
	    	if ( i == 1 ) {			//!upper row, left
	    		if ( fieldFormat[i].equals("time") == true and fieldValue[i] > 36000) { 
	    			Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"135,100,146,033,107,126,062");
	    		} else {
	    			Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"128,100,131,045,107,126,062");
	    		}
	       	} else if ( i == 2 ) {	//!upper row, right
	    		if ( fieldFormat[i].equals("time") == true and fieldValue[i] > 36000) { 
	    			Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"294,100,319,208,107,290,062");
	    		} else {
	    			Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"287,100,308,220,107,290,062");
	    		}
	       	} else if ( i == 3 ) {  //!middle upper row, left
	    		if (uUpperMiddleRowBig == false) {
	    			Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"062,183,000,000,000,062,145");
	    		} else {
	    			Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"128,169,000,000,000,027,146");
	    		}
	       	} else if ( i == 4 ) {	//!middle upper row, middle
	    		if (uUpperMiddleRowBig == false) {
	    			Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"205,183,000,000,000,205,145");
	    		}
	       	} else if ( i == 5 ) {  //!middle upper row, right
	    		if (uUpperMiddleRowBig == false) {
	    			Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"351,183,000,000,000,349,145");
	    		} else {
	    			Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"287,169,000,000,000,391,146");
	    		}
	       	} else if ( i == 6 ) {	//!middle lower row, left
	    		if (uLowerMiddleRowBig == false) {
	    			Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"062,266,000,000,000,062,228");
	    		} else {
	    			Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"128,253,000,000,000,027,229");
	    		}
	       	} else if ( i == 7 ) {	//!middle lower row, right
	    		if (uLowerMiddleRowBig == false) {
	    			Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"205,266,000,000,000,205,228");
	    		}
	       	} else if ( i == 8 ) {  //!middle lower row, right
	    		if (uLowerMiddleRowBig == false) {
	    			Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"351,266,000,000,000,349,228");
	    		} else {
	    			Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"287,253,000,000,000,391,229");
	    		}
	       	} else if ( i == 9 ) {	//!lower row, left
	    			    		if ( fieldFormat[i].equals("time") == true and fieldValue[i] > 36000) { 
	    			Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"135,324,155,046,330,138,370");
	    		} else {
	    			Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"128,324,143,058,330,138,370");
	    		}
	       	} else if ( i == 10 ) {	//!lower row, right
	    			    		if ( fieldFormat[i].equals("time") == true and fieldValue[i] > 36000) { 
	    			Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"294,324,311,204,330,272,370");
	    		} else {
	    			Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"287,324,299,214,330,272,370");
	    		}
       		}       	
		}
		
		//! Bottom battery indicator
	 	var stats = Sys.getSystemStats();
		var pwr = stats.battery;
		var mBattcolor = (pwr > 15) ? mColourFont : Graphics.COLOR_RED;
		dc.setColor(mBattcolor, Graphics.COLOR_TRANSPARENT);
		dc.fillRectangle(159, 385, 94, 27);
		dc.fillRectangle(253, 392, 6, 12);
	
		dc.setColor(mColourBackGround, Graphics.COLOR_TRANSPARENT);
		var Startstatuspwrbr = 163 + Math.round(pwr*0.86)  ;
		var Endstatuspwrbr = 86 - Math.round(pwr*0.86) ;
		dc.fillRectangle(Startstatuspwrbr, 388, Endstatuspwrbr, 21);

		if ( pwr > 50 ) {
			dc.drawText(183+25*(pwr-50)/50, 397, Graphics.FONT_XTINY, pwr.format("%0d") + "%", Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
		} else{
			dc.setColor(mColourFont, Graphics.COLOR_TRANSPARENT);
			dc.drawText(229-24*(50-pwr)/50, 397, Graphics.FONT_XTINY, pwr.format("%0d") + "%", Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
		}	

	   } else {
	   //! Display demo screen
		dc.setColor(mColourFont, Graphics.COLOR_TRANSPARENT);

		if (licenseOK == true) {
      		dc.drawText(208, 178, Graphics.FONT_TINY, "Registered !!", Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
			dc.drawText(120, 238, Graphics.FONT_XTINY, "License code: ", Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
			dc.drawText(267, 238, Graphics.FONT_MEDIUM, mtest, Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
			if (c0Version == true) {
				dc.drawText(120, 282, Graphics.FONT_XTINY, "C-Code: ", Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
				dc.drawText(253, 282, Graphics.FONT_MEDIUM, CCode, Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
			}
		} else {
      		dc.drawText(208, 49, Graphics.FONT_XTINY, "License needed !!", Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
      		dc.drawText(208, 94, Graphics.FONT_XTINY, "Run is recorded though", Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
			dc.drawText(89, 156, Graphics.FONT_MEDIUM, "ID 0: ", Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
			dc.drawText(249, 147, Graphics.FONT_NUMBER_MEDIUM, ID0+12781, Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
			dc.drawText(89, 230, Graphics.FONT_MEDIUM, "ID 1: " , Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
			dc.drawText(249, 221, Graphics.FONT_NUMBER_MEDIUM, ID1, Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
			dc.drawText(89, 305, Graphics.FONT_MEDIUM, "ID 2: " , Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
			dc.drawText(249, 296, Graphics.FONT_NUMBER_MEDIUM, ID2, Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
      	}
	   }
	   
	}

}