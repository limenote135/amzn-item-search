import { Button } from "@mui/material";
import { logout } from "@/plugin/auth";

const MyPage = () => {
  const handleLogout = () => {
    logout();
  };

  return (
    <Button color="inherit" onClick={handleLogout}>
      Logout
    </Button>
  );
};

export default MyPage;
