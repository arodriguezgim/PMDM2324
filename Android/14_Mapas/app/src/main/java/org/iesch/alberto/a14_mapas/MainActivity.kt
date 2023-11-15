package org.iesch.alberto.a14_mapas

import android.content.pm.PackageManager
import android.graphics.Color
import android.location.Location
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import com.google.android.gms.maps.CameraUpdateFactory
import com.google.android.gms.maps.GoogleMap
import com.google.android.gms.maps.GoogleMap.OnMyLocationClickListener
import com.google.android.gms.maps.OnMapReadyCallback
import com.google.android.gms.maps.SupportMapFragment
import com.google.android.gms.maps.model.Dash
import com.google.android.gms.maps.model.Dot
import com.google.android.gms.maps.model.Gap
import com.google.android.gms.maps.model.LatLng
import com.google.android.gms.maps.model.MarkerOptions
import com.google.android.gms.maps.model.Polyline
import com.google.android.gms.maps.model.PolylineOptions
import com.google.android.gms.maps.model.RoundCap

class MainActivity : AppCompatActivity(), OnMapReadyCallback, OnMyLocationClickListener {

    private lateinit var map : GoogleMap

    companion object {
        private const val LOCATION_PERMISSION_REQUEST_CODE = 1
    }


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        createFragment()
    }

    private fun createFragment() {
        // Este método nos creará el mapa
        val mapFragment = supportFragmentManager.findFragmentById(R.id.map) as SupportMapFragment
        mapFragment.getMapAsync(this)
    }

    override fun onMapReady(googleMap: GoogleMap) {
        // Este metodo se llamará cuando el mapa haya sido cargado
        map = googleMap
        createMarker()
        createPolylines()
        map.setOnMyLocationClickListener(this)
        enableLocation()
    }

    private fun createPolylines(){
        val pattern = listOf(
            Dot(), Gap(10f), Dash(50f), Gap(10f)
        )
        // hemos de ir poniendole coordenadas
        val polylineOptions = PolylineOptions()
            .add(LatLng(40.34475580071887,-1.1136298900073598))
            .add(LatLng(40.34293513814745,-1.1104562276083527))
            .add(LatLng(40.33970984382654,-1.106429430156794))
            .add(LatLng(40.344469699854585,-1.105064414072075))
            .add(LatLng(40.34787682222819,-1.1093642147403386))
            .add(LatLng(40.34688851437525,-1.1139370186266149))
           //.add(LatLng(40.34475580071887,-1.1136298900073598))
        // Engordamos la linea
            .width(20f)
            .color(ContextCompat.getColor(this, R.color.turquesa))
            .pattern(pattern)

        val polyline = map.addPolyline(polylineOptions)

        polyline.isClickable = true
        map.setOnPolylineClickListener { polyline ->
            changeColor(polyline)
        }

        //polyline.startCap = RoundCap()
        //polyline.endCap = RoundCap()

    }

    private fun changeColor(polyline: Polyline) {
        val color = (0..3).random()
        when(color){
            0 -> polyline.color = Color.RED
            1 -> polyline.color = Color.GREEN
            2 -> polyline.color = Color.BLUE
            3 -> polyline.color = Color.YELLOW

        }
    }


    private fun createMarker() {
        val plaza_torico = LatLng(40.342681153735114, -1.107172210218962)
        val marker = MarkerOptions().position(plaza_torico).title("Plaza del Torico, Teruel")

        map.addMarker(marker)
        map.animateCamera(
            CameraUpdateFactory.newLatLngZoom(plaza_torico, 15f),
            4000,
            null
        )
    }
    // 1 - Creamos un metodo para saber si tenemos permisos o no
    private fun isLocationPermissionGranted():Boolean = ContextCompat.checkSelfPermission(this,
            android.Manifest.permission.ACCESS_FINE_LOCATION) == PackageManager.PERMISSION_GRANTED

    // 2 Creamos una funcion que compruebe esto
    private fun enableLocation(){
        // Si todavia el mapa no se ha cargado salimos de esta funcion
        if (!::map.isInitialized) return

        if (isLocationPermissionGranted()){
            // Tenemos permisos
            map.isMyLocationEnabled = true
        } else {
            // Pedimos permisos
            requestLocationPermission()
        }
    }
    // 3 Creamos una Funcion para solicitar los permisos
    private fun requestLocationPermission(){
        if (ActivityCompat.shouldShowRequestPermissionRationale(this, android.Manifest.permission.ACCESS_FINE_LOCATION)){
            // Si entro por aqui será porque he rechazado previamente los servicios de ubicacion
            Toast.makeText(this, "Ve a ajustes y acepta los permisos de localización", Toast.LENGTH_SHORT).show()
        } else {
            ActivityCompat.requestPermissions(this, arrayOf(android.Manifest.permission.ACCESS_FINE_LOCATION), LOCATION_PERMISSION_REQUEST_CODE)
        }
    }

    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<out String>,
        grantResults: IntArray
    ) {
        when(requestCode){
            LOCATION_PERMISSION_REQUEST_CODE -> {
                if (grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED){
                    map.isMyLocationEnabled = true
                } else {
                    Toast.makeText(this, "Para activar la localizacion ve a ajustes y acepta los permisos de localizacion", Toast.LENGTH_SHORT).show()
                }
            }
        }
    }

    override fun onMyLocationClick(p0: Location) {
        // Cuando pulse en el botoncito azul se llamara a este metodo
        Toast.makeText(this, "Estas en ${p0.latitude}, ${p0.longitude}", Toast.LENGTH_SHORT).show()
    }

}










































