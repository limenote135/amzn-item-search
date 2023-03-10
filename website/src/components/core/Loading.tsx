import { Box, CircularProgress } from "@mui/material";

export const Loading = () => {
  return (
    <Box mt={2} textAlign={"center"}>
      <CircularProgress />
    </Box>
  );
};
