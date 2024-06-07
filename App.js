import { NavigationContainer } from "@react-navigation/native";
import { createStackNavigator } from "@react-navigation/stack";
import React from "react";

import Auth from "./lib/AuthPage";

// создаем экхемпляр объекта навигатора состояний
const Stack = createStackNavigator();

// обрабатываем первичный запрос пользователя
// По умолчанию откроются данные для ввода логина и пароля
export default function App() {
    return (
        <NavigationContainer>
            <Stack.Navigator
                initialRouteName="AuthPage"
                screenOptions={{
                    headerStyle: {
                        backgroundColor: "#000",
                        color: "#fff",
                    },
                }}
            >
                <Stack.Screen
                    name="AuthPage"
                    component={Auth}
                    options={{ headerShown: false }}
                />
            </Stack.Navigator>
        </NavigationContainer>
    );
}
