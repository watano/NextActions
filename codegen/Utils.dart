library Utils;

import 'dart:io';
import 'dart:convert';

String joinText(Iterable array, String prefix, String postfix) {
  return joinText2(array, prefix, postfix, postfix);
}

String joinText2(Iterable array, String prefix, String postfix, String delPostfix) {
  String out = '';
  array.forEach((f) => (out += prefix + f + postfix));
  return rmPostfix(out, delPostfix);
}


String repetText(String text, int len) {
  String out = '';
  for (int i = 0; i < len; i++) {
    out += text;
  }
  return out.substring(0, out.length - text.length);
}

String repetText2(String text, int len) {
  String out = '';
  for (int i = 0; i < len; i++) {
    out += text;
  }
  return out;
}

String rmPrefix(String target, String prefix) {
  if (target.startsWith(prefix)) {
    return target.substring(prefix.length);
  }
  return target;
}

String rmPostfix(String target, String postfix) {
  if (target.endsWith(postfix)) {
    return target.substring(0, target.length - postfix.length);
  }
  return target;
}

String toFirstUpperCase(String text) {
  return text.substring(0, 1).toUpperCase() + text.substring(1);
}

String nullText(String cnd, String out, {String defaultValue: ''}) {
  return trueText(cnd != null, out, defaultValue: defaultValue);
}

String trueText(bool cnd, String out, {String defaultValue: ''}) {
  return cnd ? out : defaultValue;
}

String regReplace(String str, String regExp, String replace) {
  return str.replaceAllMapped(new RegExp(regExp, caseSensitive: false), (Match m) {
    String newReplace = replace;
    if (m.groupCount > 0) {
      for (int i = 0; i < m.groupCount + 1; i++) {
        //print('\\'+i.toString() +'--'+ m.group(i) +'--'+m.groupCount.toString());
        newReplace = newReplace.replaceAll('\\' + i.toString(), m.group(i));
      }
    }
    return newReplace;
  });
}

void writeToFile(String path, String contents, {String encoding: 'utf-8'}) {
  var codeFile = new File(path);
  print(codeFile.path);
  Encoding e = Encoding.getByName('utf-8');
  if (encoding == 'utf-8' || encoding == 'utf8') {
    e = Encoding.getByName('utf-8');
  } else if (encoding == 'SYSTEM') {
    e = new SystemEncoding();
  }
  codeFile.writeAsString(contents, mode: FileMode.WRITE, encoding: e);
}

List<String> readFileLines(String path, {String encoding: 'utf-8'}) {
  var codeFile = new File(path);
  Encoding e = Encoding.getByName('utf-8');
  if (encoding == 'utf-8' || encoding == 'utf8') {
    e = Encoding.getByName('utf-8');
  } else if (encoding == 'SYSTEM') {
    e = new SystemEncoding();
  }
  return codeFile.readAsLinesSync(encoding: e);
}

void getUrl(String url, Function fun) {
  var httpClient = new HttpClient();
  var data = '';

  httpClient.getUrl(Uri.parse(url)).then((HttpClientRequest request) {
    return request.close();
  }).then((HttpClientResponse response) {
    print('Status code: ${response.statusCode}');
    print('Headers\n${response.headers}');
    var s = response.transform(UTF8.decoder);
    s.forEach((String line) {
      data += line;
    }).then((dynamic t) {
      fun(data);
    });
  }).catchError((e) {
    print(e);
  }).whenComplete(() {
    httpClient.close();
  });
}
