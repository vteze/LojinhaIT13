# Front-End

## :information_source: How To Use

To clone and run this application, you'll need [Git](https://git-scm.com), [Flutter][flutter], [JDK][jdk], [.NET][.net] and [.NET-EF-CLI][.net-ef-cli] installed on your computer.

From your command line:

### Install API

```bash
# Clone this repository
$ git clone https://github.com/vteze/LojinhaIT13

# Go into the repository
$ cd LojinhaIT13/BackEnd

# Install dependencies
$ dotnet restore

# Run Migrations
$ dotnet ef database update

# Start server
$ dotnet run

# running on port 5000 and 5001
```

### Install Front-end

```bash
# Clone this repository
$ git clone https://github.com/vteze/LojinhaIT13

# Go into the repository
$ cd LojinhaIT13/Front_end

# Install dependencies
$ flutter pub get

# Run
$ flutter run
```

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

[flutter]: https://flutter.dev/?gclid=CjwKCAjw1JeJBhB9EiwAV612y7RdQQLy091TGCihjdJTxkM8AOlKm-63n4RvVdA1nQIFmq3BedG8zBoCdkYQAvD_BwE&gclsrc=aw.ds
[jdk]: https://developers.redhat.com/products/openjdk/download?sc_cid7013a000002vuYUAAY&gclid=CjwKCAjw1JeJBhB9EiwAV612y1GfDQdg-NBCBblH-03wPZ1vW07jEu1bTmzCLT4LItuhwFvr6mmhkBoC8g8QAvD_BwE
[.net]: https://dotnet.microsoft.com/download/dotnet/thank-you/sdk-5.0.400-windows-x64-installer
[.net-ef-cli]: https://docs.microsoft.com/en-us/ef/core/cli/dotnet
