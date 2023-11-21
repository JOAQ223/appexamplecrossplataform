import 'package:flutter/material.dart';
import './style/style.dart';

class Group {
  String name;
  String administrator;
  List<Member> members;

  Group(
      {required this.name, required this.administrator, required this.members});
}

class Member {
  String name;
  String email;

  Member({required this.name, required this.email});
}

class OptionsScreen extends StatelessWidget {
  final List<Group> groups = [
    Group(
      name: 'Rock Band',
      administrator: 'John Doe (john@rockband.com)',
      members: [
        Member(name: 'John Doe', email: 'john@rockband.com'),
        Member(name: 'Ozzy Osburn', email: 'ozzy@idintcare.com'),
        Member(name: 'Paul Mcartie', email: 'paul@idintcare.com')
        // ... other members
      ],
    ),
    Group(
      name: 'POP band',
      administrator: 'Brithney spears (john@rockband.com)',
      members: [
        Member(name: 'Dereck dees', email: 'john@rockband.com'),
        Member(name: 'Deniis dees', email: 'deniss@thm.de'),
      ],
    ),
    Group(
      name: 'Wg expensses',
      administrator: 'Helena Fisher helena@schalgear.de.com)',
      members: [
        Member(name: 'Cristian silva ', email: 'cristian.silver@rockband.com'),
        Member(name: 'Max Muster ', email: 'max,muster@rockband.com'),
      ],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Options')),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search Group',
                suffixIcon: Icon(Icons.search),
              ),
              onSubmitted: (String value) {
                // Handle search logic here
              },
            ),
          ),
          Padding(
            padding: AppStyles.buttonPadding, // Use the defined style
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: ElevatedButton(
                      child: Text('Join Group'),
                      style: AppStyles.blueButtonStyle, // Use the defined style
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                JoinGroupScreen(groups: groups),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: ElevatedButton(
                      child: Text('Create Group'),
                      style:
                          AppStyles.orangeButtonStyle, // Use the defined style
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateGroupScreen()),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Other widgets or content can be added here
        ],
      ),
    );
  }
}

class JoinGroupScreen extends StatelessWidget {
  final List<Group> groups;

  JoinGroupScreen({required this.groups});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Join a Group')),
      body: ListView.builder(
        itemCount: groups.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(groups[index].name),
            subtitle: Text('Admin: ${groups[index].administrator}'),
            onTap: () {
              // Handle group selection logic here
            },
          );
        },
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: AppStyles.buttonPadding, // Use the defined style for padding
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: ElevatedButton(
                  child: Text('Login'),
                  style: AppStyles.blueButtonStyle, // Use the defined style
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginFormScreen()),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: ElevatedButton(
                  child: Text('Register'),
                  style: AppStyles.orangeButtonStyle, // Use the defined style
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CreateGroupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Group')),
      body: Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Group Name'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Group Description'),
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Max Members'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Administrator Email'),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Create Group'),
                onPressed: () {
                  // Handle Create Group action
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginFormScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login(BuildContext context) {
    String username = usernameController.text;
    String password = passwordController.text;

    if (username.isNotEmpty && password.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OptionsScreen()),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please fill in all fields'),
            actions: <Widget>[
              TextButton(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Login'),
              onPressed: () => _login(context),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Password'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Vorname'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Register'),
              onPressed: () {
                // Handle registration logic here
              },
            ),
          ],
        ),
      ),
    );
  }
}
