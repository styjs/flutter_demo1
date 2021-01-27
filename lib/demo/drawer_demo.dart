import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('NiHao', style: TextStyle(fontWeight: FontWeight.bold)),
            accountEmail: Text('1247956387@qq.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage('https://static.xianglinsen.com/d0096ec6c83575373e3a21d129ff8fef0.5295736920009524'),
            ),
            decoration: BoxDecoration(
              color: Colors.yellow[400],
              image: DecorationImage(
                image: NetworkImage('https://static.xianglinsen.com/b775de4d4078c1996a3c40e5871a96d60.5658877501642778'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.yellow[400].withOpacity(0.3), BlendMode.modulate)
              )
            ),
          ),
          ListTile(
            title: Text('Messages', textAlign: TextAlign.right,),
            trailing: Icon(Icons.message, size: 22.0, color: Colors.black12),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text('Favorite', textAlign: TextAlign.right,),
            trailing: Icon(Icons.favorite, size: 22.0, color: Colors.black12),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text('Settings', textAlign: TextAlign.right,),
            trailing: Icon(Icons.settings, size: 22.0, color: Colors.black12),
            onTap: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }
}

