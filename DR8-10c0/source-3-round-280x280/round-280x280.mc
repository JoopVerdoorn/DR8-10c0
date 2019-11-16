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

		//! Draw separator lines
        dc.setColor(mColourLine, Graphics.COLOR_TRANSPARENT);
        dc.setPenWidth(2);

        //! Horizontal dividers
        dc.drawLine(47,  33,  233, 33);
        dc.drawLine(4,   89,  277, 89);
        dc.drawLine(0,   145, 280, 145);
        dc.drawLine(3,   201,  277, 201);
        dc.drawLine(62, 257, 218, 257);
//! tot hier gekomen
        //! Vertical dividers
        dc.drawLine(119, 29,  119, 77);
        dc.drawLine(73,  77,  73,  173);
        dc.drawLine(164, 77,  164, 173);
        dc.drawLine(119, 173, 119, 219);

		//! Display metrics
        dc.setColor(mColourFont, Graphics.COLOR_TRANSPARENT);

		myTime = Toybox.System.getClockTime(); 
    	strTime = myTime.hour.format("%02d") + ":" + myTime.min.format("%02d");
		//! Show number of laps or clock with current time in top
		if (uMilClockAltern == 0) {		
			dc.drawText(140, -3, Graphics.FONT_MEDIUM, strTime, Graphics.TEXT_JUSTIFY_CENTER);
		}

		for (var i = 1; i < 11; ++i) {
	    	if ( i == 1 ) {			//!upper row, left
	    		Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"074,058,075,026,062,073,034");
	       	} else if ( i == 2 ) {	//!upper row, right
	    		Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"165,058,177,127,062,167,034");
	       	} else if ( i == 3 ) {  //!middle row, left
	    		Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"036,106,000,000,000,036,082");
	       	} else if ( i == 4 ) {	//!middle row, middle
	    		Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"118,105,000,000,000,118,082");
	       	} else if ( i == 5 ) {  //!middle row, right
	    		Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"202,107,000,000,000,201,082");
	       	} else if ( i == 6 ) {	//!lower row, left
	    		Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"036,154,000,000,000,036,130");
	       	} else if ( i == 7 ) {	//!lower row, right
	    		Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"118,154,000,000,000,118,130");
	       	} else if ( i == 8 ) {  //!middle row, right
	    		Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"202,154,000,000,000,201,130");
	       	} else if ( i == 9 ) {	//!lower row, left
	    		Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"074,201,075,026,189,080,178");
	       	} else if ( i == 10 ) {	//!lower row, right
	    		Formatting(dc,i,fieldValue[i],fieldFormat[i],fieldLabel[i],"165,201,177,127,189,157,178");
       		}       	
		}
		
		//! Bottom battery indicator
	 	var stats = Sys.getSystemStats();
		var pwr = stats.battery;
		var mBattcolor = (pwr > 15) ? mColourFont : Graphics.COLOR_RED;
		dc.setColor(mBattcolor, Graphics.COLOR_TRANSPARENT);
		dc.fillRectangle(107, 259, 63, 18);
		dc.fillRectangle(170, 264, 4, 8);
	
		dc.setColor(mColourBackGround, Graphics.COLOR_TRANSPARENT);
		var Startstatuspwrbr = 110 + Math.round(pwr*0.58)  ;
		var Endstatuspwrbr = 58 - Math.round(pwr*0.58) ;
		dc.fillRectangle(Startstatuspwrbr, 261, Endstatuspwrbr, 14);	

	   } else {
	   //! Display demo screen
		dc.setColor(mColourFont, Graphics.COLOR_TRANSPARENT);

		if (licenseOK == true) {
      		dc.drawText(140, 40, Graphics.FONT_XTINY, "Datarun prem 7 c0", Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
			dc.drawText(140, 120, Graphics.FONT_TINY, "Registered !!", Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
			dc.drawText(81, 160, Graphics.FONT_XTINY, "License code: ", Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
			dc.drawText(180, 160, Graphics.FONT_MEDIUM, mtest, Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
			dc.drawText(81, 190, Graphics.FONT_XTINY, "C-Code: ", Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
			dc.drawText(170, 190, Graphics.FONT_MEDIUM, CCode, Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
		} else {
      		dc.drawText(140, 33, Graphics.FONT_XTINY, "License needed !!", Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
      		dc.drawText(140, 63, Graphics.FONT_XTINY, "Run is recorded though", Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
			dc.drawText(60, 105, Graphics.FONT_MEDIUM, "ID 0: ", Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
			dc.drawText(161, 99, Graphics.FONT_NUMBER_MEDIUM, ID0, Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
			dc.drawText(60, 155, Graphics.FONT_MEDIUM, "ID 1: " , Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
			dc.drawText(161, 149, Graphics.FONT_NUMBER_MEDIUM, ID1, Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
			dc.drawText(60, 205, Graphics.FONT_MEDIUM, "ID 2: " , Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
			dc.drawText(161, 199, Graphics.FONT_NUMBER_MEDIUM, ID2, Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER);
      	}
	   }
	   
	}

}