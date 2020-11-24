package com.example.loginactivitywithhelloandroidactivity

import android.content.res.Configuration
import android.net.wifi.hotspot2.pps.HomeSp
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.MenuItem
import android.widget.Toast
import android.widget.Toast.makeText
import androidx.appcompat.app.ActionBarDrawerToggle
import androidx.drawerlayout.widget.DrawerLayout
import androidx.appcompat.widget.Toolbar
import androidx.core.view.GravityCompat
import androidx.fragment.app.FragmentTransaction
import com.google.android.material.navigation.NavigationView


class HomeActivity : AppCompatActivity(), NavigationView.OnNavigationItemSelectedListener {

    lateinit var drawer: DrawerLayout
    lateinit var toggle: ActionBarDrawerToggle
    lateinit var homeFragment: HomeFragment
    lateinit var galleryFragment: GalleryFragment
    lateinit var aboutFragment: AboutFragment

    // onCreate Method
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_home)

        val navView: NavigationView = findViewById(R.id.navigation_viewID)
        navView.setNavigationItemSelectedListener(this)

        val toolbar: Toolbar = findViewById(R.id.toolbar_main)
        this.setSupportActionBar(toolbar)

        drawer = findViewById(R.id.drawer_layoutID)
        toggle = ActionBarDrawerToggle(this, drawer, toolbar, R.string.navigation_drawer_open, R.string.navigation_drawer_close)
        drawer.addDrawerListener(toggle)
        toggle.syncState()
        supportActionBar?.setDisplayHomeAsUpEnabled(true)
        supportActionBar?.setHomeButtonEnabled(true)

    }

    // onPostCreate Method
    override fun onPostCreate(savedInstanceState: Bundle?) {
        super.onPostCreate(savedInstanceState)
        toggle.syncState()
    }

    // onConfigurationChanged Method
    override fun onConfigurationChanged(newConfig: Configuration) {
        super.onConfigurationChanged(newConfig)
        toggle.onConfigurationChanged(newConfig)
    }

    // onOptionsItemSelected Method
    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        if(toggle.onOptionsItemSelected(item))
            return true
        return super.onOptionsItemSelected(item)
    }

    // onNavigationItemSelected Method
    override fun onNavigationItemSelected(item: MenuItem): Boolean {

        when(item.itemId){
            R.id.naviHomeID -> {
                Toast.makeText(this, "clicked home", Toast.LENGTH_LONG).show()
                homeFragment = HomeFragment()
                supportFragmentManager
                    .beginTransaction()
                    .replace(R.id.content_frame, homeFragment)
                    .setTransition(FragmentTransaction.TRANSIT_FRAGMENT_OPEN)
                    .commit()
            }
            R.id.naviGalleryID -> {
                Toast.makeText(this, "clicked gallery", Toast.LENGTH_LONG).show()
                galleryFragment = GalleryFragment()
                supportFragmentManager
                    .beginTransaction()
                    .replace(R.id.content_frame, galleryFragment)
                    .setTransition(FragmentTransaction.TRANSIT_FRAGMENT_OPEN)
                    .commit()
            }
            R.id.naviAboutID -> {
                Toast.makeText(this, "clicked about", Toast.LENGTH_LONG).show()
               aboutFragment = AboutFragment()
                supportFragmentManager
                    .beginTransaction()
                    .replace(R.id.content_frame, aboutFragment)
                    .setTransition(FragmentTransaction.TRANSIT_FRAGMENT_OPEN)
                    .commit()
            }
        }
        drawer.closeDrawer(GravityCompat.START)
        return true
    }

    // onBackPressed Method
    override fun onBackPressed() {

        if(drawer.isDrawerOpen(GravityCompat.START)) {
            drawer.closeDrawer(GravityCompat.START)
        }
            super.onBackPressed()

    }

}