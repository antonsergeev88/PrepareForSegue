#  PrepareForSegue
## Описание
Фрэймворк предоставляет имплементацию следующих методов UIViewController для упрощения работы с переходами:
Objective-C
```
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender;
- (BOOL)canPerformUnwindSegueAction:(SEL)action fromViewController:(UIViewController *)fromViewController withSender:(id)sender;
```
Swift
```
func prepare(for segue: UIStoryboardSegue, sender: Any?)
func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool
func canPerformUnwindSegueAction(_ action: Selector, from fromViewController: UIViewController, withSender sender: Any) -> Bool
```
Фрэймворк использует рантайм Objective-C для поиска и вызова методов, поэтому директива `@objc` в методах обязательна.
## Методы
### `prepare`
Имплементация этого метода читает идентификатор (`<Identifier>`) перехода и ищет методы по порядку:
- `@objc func prepareFor<Identifier>(with sender: Any?)`
- `@objc func prepareFor<Identifier>()`
Перед тем как возвратить, будет вызван первый найденный. Если методы не были найдены или идентификатор равен `nil` или пустой строке, то функция возвратит без дополнительных действий.
### `shouldPerformSegue`
Имплементация этого метода ищет методы по порядку:
- `@objc func shouldPerform<Identifier>(with sender: Any?) -> Bool`
- `"objc func shouldPerform<Identifier>() -> Bool`
Метод возвращает возвращаемое значение первого из найденных или `true`, если методы найдены не были или идентификатор равен `nil` или пустой строке.
### `canPerformUnwindAction`
Имплементация этого метода вызывает имплементацию UIKit и если она возвратила `false`, возвращает `false`, если она возвратила `true`, то выделяет из параметра `action` имя действия (<UnwindAction>) и ищет методы по порядку:
- `@objc func can<UnwindAction>() -> Bool`
- `@objc func can<UnwindAction>(with sender: Any) -> Bool`
Метод возвращает возвращаемое значение из первого найденного, либо `true`, если методов найдено не было. 
