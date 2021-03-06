package com.example.android4;

import android.os.Bundle;
import android.app.Activity;
import android.content.Intent;
import android.widget.CalendarView;

public class VentanaCalendarioArea extends Activity {
	private int mYear;
	private int mMonth;
	private int mDay;
	private Intent intent;
	private String tipoFecha;
	private Bundle bundle;

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		CalendarView calendar = new CalendarView(this);
		calendar.setOnDateChangeListener(mDateSetListener);
		setContentView(calendar);
		bundle = this.getIntent().getExtras();

	}

	// the callback received when the user "sets" the date in the dialog
	private CalendarView.OnDateChangeListener mDateSetListener =
			new CalendarView.OnDateChangeListener() {

		public void onSelectedDayChange(CalendarView view, int year,
				int monthOfYear, int dayOfMonth) {
			mYear = year;
			mMonth = monthOfYear;
			mDay = dayOfMonth;
			String selectedDate = new StringBuilder().append(mDay).append("-").append(mMonth + 1).append("-")
					.append(mYear).append(" ").toString();

			intent = new Intent( VentanaCalendarioArea.this, VentanaReservacion.class);
			Bundle b = new Bundle(); 
			
			tipoFecha = bundle.getString("fecha");
			
			if(tipoFecha.equalsIgnoreCase("inicial")){
				b.putString("fecha_inicial", selectedDate);
				b.putLong("fec_ini", mDay);
				intent.putExtras(b);
				setResult( Activity.RESULT_OK, intent);
				VentanaCalendarioArea.this.finish();
			}else if(tipoFecha.equalsIgnoreCase("final")){
				b.putString("fecha_final", selectedDate);
				b.putLong("fec_fin", mDay);
				intent.putExtras(b);
				setResult( Activity.RESULT_OK, intent);
				VentanaCalendarioArea.this.finish();
			}

			//Bundle b = new Bundle();
			//b.putString("dateSelected", selectedDate);

			//Add the set of extended data to the intent and start it
			Intent intent = new Intent();
			intent.putExtras(b);
			setResult(RESULT_OK,intent);      
			finish();
		}
	};

}
