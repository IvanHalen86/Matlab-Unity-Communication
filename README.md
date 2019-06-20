# Matlab-Unity-Communication
This are simple script to make Matlab communicate with unity

You can find the video tutorial at this link

IMPORTANT: in the oublic class ***** : MonoBehaviour

Instead of the ***** write the name of the c sharp file. In my case it was Cylinder. Check in the object you created in unity which is
the name of the obejct and name the file in the same way.

The most important thing is that when you created the c sharp file in unity, you first press play in unity and then run the matlab code,
otherwise it will not work.

If you are interested only in the c sharp code that makes them communicate, you can find it below:

using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Net;
using System.Net.Sockets;
using System.Linq;
using System;
using System.IO;
using System.Text;


public class Cylinder : MonoBehaviour
{    // Set 2 floating numbers for the left and right directions
public float LEFT;
public float RIGHT;
public float UP;
public float DOWN
// initialize the communication with matlab
// Use this for initialization
TcpListener listener;
// the msg is the value that you put in the msg matrix in matlab
String msg;
// Start is called before the first frame update
void Start()   
{ // LISTEN TO MATLAB. Set up unity listening to matlab
listener = new TcpListener(IPAddress.Parse("127.0.0.1"), 55001);
listener.Start();
print("is listening");
} // Update is called once per frame
void Update()
{
if (!listener.Pending())
{ } else
{ // print the message that unity is listening.
print("socket comes");
TcpClient client = listener.AcceptTcpClient();
NetworkStream ns = client.GetStream();
StreamReader reader = new StreamReader(ns);
msg = reader.ReadToEnd();
print(msg);
}
 }
 }
